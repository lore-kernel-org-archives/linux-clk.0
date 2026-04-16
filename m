Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9094C3E0234
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 14:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776350979; cv=none; b=BbSqEepoHsJGh0qJblF1q/P97PZp3bmX8c+SaDhBG/vHono6H/E3JtFcyu14eAVDLSNkZw+SPz6KlYZrYxM6HiiXYAmlwY89Zj7W77XgOo8NEcCIdE9IViia7dWodmHD07Wl+GzcrX3SoLbArldjmLN9dTnFjCqMcaTHCCzwGH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776350979; c=relaxed/simple;
	bh=qWFuADgouw7Y28f8Ks2Rqs0pWL1FBVPTXx/dspPKr4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=shKOl2B7NmwyI+st18ooHFGssb3XEJuVyWB3y+nmYD1baJQjt5CgttTYqEwdKWPgjX2u66YgkWtX4jWXpoPrsMNI0DR01XU5cTRWm5Z5AMkzJUcmf0twKm3jhNz6tGTZ/ptDvyaRxGk5TGgC6QxC87GEPagmEXdvv4+bFQ2oCSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Lo0S5bUs; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Lo0S5bUs"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488a29e6110so85121245e9.3
        for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 07:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776350976; x=1776955776; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tXwMjFpu/xE0paqzhDs94eqBbHdGY9DRyzE65FFhgNk=;
        b=Lo0S5bUsorsa2EhvKSEGUWW7+50RKG/1eB+lWtByeYAXgBOBBMOXr6Bfc85/ah8XG5
         hpjjV9Amogif+o5ANdx/MhPZBlvaXZQLm/sjsWiuax7JXjKs75B6kjIQy7yVOdAliXHE
         SG2gE5C2VUr3due1blQsoQ6RhJ/sm3RfpSEW0kJiAVQwpYaJyDKpB0W7G0LrmIH32Y9q
         Cm2jDTxYgMMHxXqL1xvch7hp5HlqL4LT0w1sOuDAOlQL0ygybgABc1A2oEMBR7T55eou
         +KlNH6iN+L28qcJSd+J0AuHrmCCs30UFG7C1bWDBkPKiEBcKOzz1gn35RIw/FN+gvNsv
         5cGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776350976; x=1776955776;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tXwMjFpu/xE0paqzhDs94eqBbHdGY9DRyzE65FFhgNk=;
        b=BDzJd7May3xOzmUldexCe+Bg5Ursl/DViaqU1DInO7q5jRbHSzc26i/rfB4cgZQgoV
         dEQnOH8a1yO6mDB97AEXY6nozSkk/DxX3w6YKDABJMZwjCtQP8OYGPuTNUbP6UADxM/h
         zuGqkx3EP74/zhDcJuzgaGlCvuBypUFMmzopwh1RHpB5ap3sOFBVcHIDieTYfeESKGX0
         OLAbj0KIrP52hmLf89YF40e8DV9IlRcAkL8spGTBbQFL0YNfdaKYnoSsQ8YlZFsoX8eR
         pRpJVYvPotJ44aStmUBbf99I3Sz1xMxkJzSp1tFP+8c/n1u5GYgCGYtPa1zLgj+U1Ji0
         Ofdg==
X-Forwarded-Encrypted: i=1; AFNElJ/expmfarKo+99YQju5w8Ucc2C+Yz1XOAmjs+0RZmIDJtPeW343JJFJCmz1NzTZdwPwFOvrLvofXAM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyILRLVLLnU6AI5s8sRCmwFTRwtp7LcCKfuZ2S823HA9d8FPV/2
	EREQhR5HLeu5CaVk4Nae7fNECWUdhK0Cg1lCGYZMv0bYLn97s1wJOh+NrG7Y06evZHs=
X-Gm-Gg: AeBDievkQar3op64bD2dKHSUOKRG8+f6Dy9+lRffB4vgfig5G7q4BBMu5elaU5WIR2P
	MwlX39olBju/Vhh4wsD5RBVnOCkAW024/WJt8YW5jpi0aKgWjHlF1nhT6u/sqdP5BAh5T1apPfn
	/adEHjU8fUMHutWwcKzUMSq5nehczHwXDYaN4Xn0irje7s3utWv49P8fow/8s1a6I88Ek6g5Ujg
	lItQOlQgdKfEVpNIelyWM2zD0NUfBmea6EdBoGj6xlqA8MxsW/riNjFDhVodgxYeL/yEAZQwbnn
	hCmtQn10iBqn6d6tLH+5GE5Sb4ChSy8+vnbFtKGM2jTIhv2vZRslbdgpwi1+fumK9Zu5y710hr1
	0C7tFFf2r4USVk4fbUlI0r2cwMiB8ysH4QYAM48VdSDsowMvjkKoSTymkTeB3IdfjZculn/+zxb
	pWtGfiVrVyE6R6qxfYQY6KLjWPKbtMJOqlhbKD
X-Received: by 2002:a05:600c:8904:b0:487:1c2:6a56 with SMTP id 5b1f17b1804b1-488d67ec89amr276975035e9.3.1776350975981;
        Thu, 16 Apr 2026 07:49:35 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f5818e51sm95699055e9.5.2026.04.16.07.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 07:49:35 -0700 (PDT)
Date: Thu, 16 Apr 2026 16:49:32 +0200
From: Petr Mladek <pmladek@suse.com>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Song Chen <chensong_2000@189.cn>, rafael@kernel.org, lenb@kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org, viresh.kumar@linaro.org,
	agk@redhat.com, snitzer@kernel.org, mpatocka@redhat.com,
	bmarzins@redhat.com, song@kernel.org, yukuai@fnnas.com,
	linan122@huawei.com, jason.wessel@windriver.com, danielt@kernel.org,
	dianders@chromium.org, horms@kernel.org, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	paulmck@kernel.org, frederic@kernel.org, mcgrof@kernel.org,
	da.gomez@kernel.org, samitolvanen@google.com, atomlin@atomlin.com,
	jpoimboe@kernel.org, jikos@kernel.org, mbenes@suse.cz,
	joe.lawrence@redhat.com, rostedt@goodmis.org, mhiramat@kernel.org,
	mark.rutland@arm.com, mathieu.desnoyers@efficios.com,
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
	live-patching@vger.kernel.org, dm-devel@lists.linux.dev,
	linux-raid@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
	netdev@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] kernel/module: Decouple klp and ftrace from
 load_module
Message-ID: <aeD2_FrFL6E3dbAC@pathway.suse.cz>
References: <20260413080701.180976-1-chensong_2000@189.cn>
 <1191caf5-6a61-4622-a15e-854d3701f4fc@suse.com>
 <a35f5f94-7d5a-4347-974b-b270c89ef241@189.cn>
 <1db425bf-58a9-4768-8c38-3ae25d7662a5@suse.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1db425bf-58a9-4768-8c38-3ae25d7662a5@suse.com>

On Thu 2026-04-16 13:18:30, Petr Pavlu wrote:
> On 4/15/26 8:43 AM, Song Chen wrote:
> > On 4/14/26 22:33, Petr Pavlu wrote:
> >> On 4/13/26 10:07 AM, chensong_2000@189.cn wrote:
> >>> diff --git a/include/linux/module.h b/include/linux/module.h
> >>> index 14f391b186c6..0bdd56f9defd 100644
> >>> --- a/include/linux/module.h
> >>> +++ b/include/linux/module.h
> >>> @@ -308,6 +308,14 @@ enum module_state {
> >>>       MODULE_STATE_COMING,    /* Full formed, running module_init. */
> >>>       MODULE_STATE_GOING,    /* Going away. */
> >>>       MODULE_STATE_UNFORMED,    /* Still setting it up. */
> >>> +    MODULE_STATE_FORMED,
> >>
> >> I don't see a reason to add a new module state. Why is it necessary and
> >> how does it fit with the existing states?
> >>
> > because once notifier fails in state MODULE_STATE_UNFORMED (now only ftrace has someting to do in this state), notifier chain will roll back by calling blocking_notifier_call_chain_robust, i'm afraid MODULE_STATE_GOING is going to jeopardise the notifers which don't handle it appropriately, like:
> > 
> > case MODULE_STATE_COMING:
> >      kmalloc();
> > case MODULE_STATE_GOING:
> >      kfree();
> 
> My understanding is that the current module "state machine" operates as
> follows. Transitions marked with an asterisk (*) are announced via the
> module notifier.
> 
> ---> UNFORMED --*> COMING --*> LIVE --*> GOING -.
>         ^            |                     ^    |
>         |            '---------------------*    |
>         '---------------------------------------'
> 
> The new code aims to replace the current ftrace_module_init() call in
> load_module(). To achieve this, it adds a notification for the UNFORMED
> state (only when loading a module) and introduces a new FORMED state for
> rollback. FORMED is purely a fake state because it never appears in
> module::state. The new structure is as follows:
> 
>         ,--*> (FORMED)
>         |
> --*> UNFORMED --*> COMING --*> LIVE --*> GOING -.
>         ^            |                     ^    |
>         |            '---------------------*    |
>         '---------------------------------------'
> 
> I'm afraid this is quite complex and inconsistent. Unless it can be kept
> simple, we would be just replacing one special handling with a different
> complexity, which is not worth it.

> >>
> >>> +    if (err)
> >>> +        goto ddebug_cleanup;
> >>>         /* Finally it's fully formed, ready to start executing. */
> >>>       err = complete_formation(mod, info);
> >>> -    if (err)
> >>> +    if (err) {
> >>> +        blocking_notifier_call_chain_reverse(&module_notify_list,
> >>> +                MODULE_STATE_FORMED, mod);
> >>>           goto ddebug_cleanup;
> >>> +    }
> >>>   -    err = prepare_coming_module(mod);
> >>> +    err = prepare_module_state_transaction(mod,
> >>> +                MODULE_STATE_COMING, MODULE_STATE_GOING);
> >>>       if (err)
> >>>           goto bug_cleanup;
> >>>   @@ -3522,7 +3519,6 @@ static int load_module(struct load_info *info, const char __user *uargs,
> >>>       destroy_params(mod->kp, mod->num_kp);
> >>>       blocking_notifier_call_chain(&module_notify_list,
> >>>                        MODULE_STATE_GOING, mod);
> >>
> >> My understanding is that all notifier chains for MODULE_STATE_GOING
> >> should be reversed.
> > yes, all, from lowest priority notifier to highest.
> > I will resend patch 1 which was failed due to my proxy setting.
> 
> What I meant here is that the call:
> 
> blocking_notifier_call_chain(&module_notify_list, MODULE_STATE_GOING, mod);
> 
> should be replaced with:
> 
> blocking_notifier_call_chain_reverse(&module_notify_list, MODULE_STATE_GOING, mod);
> 
> > 
> >>
> >>> -    klp_module_going(mod);
> >>>    bug_cleanup:
> >>>       mod->state = MODULE_STATE_GOING;
> >>>       /* module_bug_cleanup needs module_mutex protection */
> >>
> >> The patch removes the klp_module_going() cleanup call in load_module().
> >> Similarly, the ftrace_release_mod() call under the ddebug_cleanup label
> >> should be removed and appropriately replaced with a cleanup via
> >> a notifier.
> >>
> >     err = prepare_module_state_transaction(mod,
> >                 MODULE_STATE_UNFORMED, MODULE_STATE_FORMED);
> >     if (err)
> >         goto ddebug_cleanup;
> > 
> > ftrace will be cleanup in blocking_notifier_call_chain_robust rolling back.
> > 
> >     err = prepare_module_state_transaction(mod,
> >                 MODULE_STATE_COMING, MODULE_STATE_GOING);
> > 
> > each notifier including ftrace and klp will be cleanup in blocking_notifier_call_chain_robust rolling back.
> > 
> > if all notifiers are successful in MODULE_STATE_COMING, they all will be clean up in
> >  coming_cleanup:
> >     mod->state = MODULE_STATE_GOING;
> >     destroy_params(mod->kp, mod->num_kp);
> >     blocking_notifier_call_chain(&module_notify_list,
> >                      MODULE_STATE_GOING, mod);
> > 
> > if  something wrong underneath.
> 
> My point is that the patch leaves a call to ftrace_release_mod() in
> load_module(), which I expected to be handled via a notifier.

I think that I have got it. The ftrace code needs two notifiers when
the module is being loaded and two when it is going.

This is why Sond added the new state. But I think that we would
need two new states to call:

    + ftrace_module_init() in MODULE_STATE_UNFORMED
    + ftrace_module_enable() in MODULE_STATE_FORMED

and

    + ftrace_free_mem() in MODULE_STATE_PRE_GOING
    + ftrace_free_mem() in MODULE_STATE_GOING


By using the ascii art:

 -*> UNFORMED -*> FORMED -> COMING -*> LIVE -*> PRE_GOING -*> GOING -.
              |          |         |                ^           ^    ^
              |          |         '----------------'           |    |
              |          '--------------------------------------'    |
              '------------------------------------------------------'


But I think that this is not worth it.

Best Regards,
Petr
