_bspc() {
	local commands='node desktop monitor query rule wm subscribe config quit'

	local settings='external_rules_command status_prefix normal_border_color active_border_color focused_border_color presel_feedback_color border_width window_gap top_padding right_padding bottom_padding left_padding top_monocle_padding right_monocle_padding bottom_monocle_padding left_monocle_padding split_ratio automatic_scheme removal_adjustment initial_polarity directional_focus_tightness borderless_monocle gapless_monocle single_monocle pointer_motion_interval pointer_modifier pointer_action1 pointer_action2 pointer_action3 click_to_focus swallow_first_click focus_follows_pointer pointer_follows_focus pointer_follows_monitor mapping_events_count ignore_ewmh_focus ignore_ewmh_fullscreen center_pseudo_tiled honor_size_hints remove_disabled_monitors remove_unplugged_monitors merge_overlapping_monitors'

	COMPREPLY=()

	if [[ $COMP_CWORD -ge 1 ]] ; then
		local current_word="${COMP_WORDS[COMP_CWORD]}"
		if [[ $COMP_CWORD -eq 1 ]] ; then
			COMPREPLY=( $(compgen -W "$commands" -- "$current_word") )
			return 0
		else
			local second_word=${COMP_WORDS[1]}
			case $second_word in
				config)
					if [[ $COMP_CWORD -eq 2 ]] ; then
						COMPREPLY=( $(compgen -W "$settings" -- "$current_word") )
						return 0
					fi
					;;
			esac
		fi
	fi
}

complete -F _bspc bspc

# vim: set ft=sh:
