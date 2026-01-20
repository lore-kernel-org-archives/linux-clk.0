Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D8243D510
	for <linux-clk@vger.kernel.org>; Tue, 20 Jan 2026 15:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768922081; cv=none; b=maHWpMDspBdydjy3o8Lh+gLWv5bvcKku3n9+xcW8wp7ytkji6r/MwNB4dHQ2wgqoUl0K5pTrChUyD1Q5Ya0ny1SwdosOa3zaAjD1h2zl34QEEoU1USFgvVRzCm15da6nySnh/N7JDJHmfLCmgqtaG7LCXOH/PDtQYq6GDK9uQ5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768922081; c=relaxed/simple;
	bh=zctGoCy9tj06FxCF/1MEy/+RkDyWDn4JObiaM6T8qrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pp/k6laS9xUO0br7mPprtpc8AktMSClhsFX5Qqc5uzVYuT2avKN0CJYQTECjM9Q4NoC8WHlDY2XhdL9djL2nSi8Qz5XnvPxUMr5rEddmqON59Pd2IhWBcyVscLUorDEmoJe8X0AQcF3b3YXGTBGZjcwahHWI23xgU+YmaJ3qRog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WXX1IXzl; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qIejbGZg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WXX1IXzl";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qIejbGZg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768922077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fMaak1xtD3IGbAXkM0qNP33HT0c4dctivzgnO4kRoKw=;
	b=WXX1IXzlQBQtbVMvW6ITakpWskNR7VFE0GdwHkQOoeZW/KKsEFXTQRXgqaOuzDDRZtoRGE
	B3H6J+EbUBUoNXlA49PmSnC+AGA3ENutUxhpFPRxxYxpxN8Hd2LwMnRAx77uynA5y3wG/m
	g/vKFy9aSIG03Pp0SYW/l36RnOdnYSs=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505-O3wXkjHfPp6GNxFXf1H42g-1; Tue, 20 Jan 2026 10:14:36 -0500
X-MC-Unique: O3wXkjHfPp6GNxFXf1H42g-1
X-Mimecast-MFC-AGG-ID: O3wXkjHfPp6GNxFXf1H42g_1768922076
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8824d5b11easo128190566d6.3
        for <linux-clk@vger.kernel.org>; Tue, 20 Jan 2026 07:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768922076; x=1769526876; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMaak1xtD3IGbAXkM0qNP33HT0c4dctivzgnO4kRoKw=;
        b=qIejbGZgKamY4rFzHLL83mnZxmxYlNkYzHuhzFCuUmVKbQMZDQKvJ7sRI0bwumDziy
         pc9UXdCLKaDNL7g09rIc5uT9boJoTG85cffw/xUmrm090O6wsQl6tH00NOC9tdZFZuGD
         kRDPdGeO1zff89wihMvd4J4xigGh1kaS5weMQyueaaVsq3gvf0tzS5FfS2/1CeGOSmfd
         n0khonoKHvSM55rdEmANHcksCKRif0/MewXEcjVJ8ARWfnZMHW9P+c9tqQ0/FIgVtqO+
         PKQ+G0qhDaigWjHUefdedvAKo89+h8Yla13NmkKSapxsJOQ3naP+qQgnX0q6ek7M+oaf
         BdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768922076; x=1769526876;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fMaak1xtD3IGbAXkM0qNP33HT0c4dctivzgnO4kRoKw=;
        b=ipUwlt0J8BuSyo6xs2H9mSXgEnqtwbHgcI3Lj7smuqnmwuhHyFZLN08GMMQjz3l3JK
         DkjUhd+B5n+1wAKrxr7OROBFNuES8EKTNQaTBQDzjFy8E0aWFdZgA2WnKmGQF0USMIba
         0oiBnt+bAQnZasJgM4R+JgBN16TAW9evm6B48GU+xqKyoou1tOZwXYA6m3zLoqVVl36I
         Kzd5XQKeVztHTn+DAJxXfORa845us3eC/khByvWDvwF4lHhdpuNkcoVQsDGe3uJveTUf
         YVVuAru2QRS/kkwl2UQuwoCM2banAbNNKNbPC+CoFVbe/Y8iCcY+yHnEbOHprwFeFxtr
         5Ikg==
X-Forwarded-Encrypted: i=1; AJvYcCWPQ0c7RD0BRB54i7WImff1KdJYDlQm55kjSbg6BJbPTF2p2Rm/kft4GCWkWrYs7FCRilOCOgEJRqo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhC/cYEhmFIHIsoRjtqBPSZxhKx1o1CdnnVT7NHSRhGmNAHqYU
	zaM8QR/2tBN9Hxaq2rAoayElkpLHVayudpkK/hIFYLa8xpdiZAUlTTYZ8hgFG51JpOL5ocm0+VD
	+/1GoYIVaPTRoDu2hz9pZD2G2YTdtj2A52Wld1igsRAXwz6v0Uo3a4/W+2G/rKQ==
X-Gm-Gg: AZuq6aKEKCNAa+d0lqPCnUNbmwiGPTz3BsqZ7cgWMo9bjdpdklL2MQUbgDdiokaig2f
	h3haseIwY5FM/1ZRiPKCXhDUEtetIKMvk2Rd4/cI6b1S/2GjU6PEpvQtOijICQFi4sU0ONs/yzu
	Qi0216cfNYwMBsHC04OcjLrFEICoL/uHNspK49vkzBrAaBPcG7XjwJ+V0eo4o+Mzdpz4DhYkyrE
	ocwJELvso7kMgjF6Xd8GPQXfLckTA393yFtBqRx064xYEe9k5ejJQ01244h9VvHwzM0h+vFckNt
	woeuC8COXb0PXOt0lMrVYzItChbA+0gz3L2QgdomovBK6o0+QSKbzsaADkaKP1Sa4uk8ZzfVdtp
	03l2tM41JlI25ihqT2b44aBAu6gKNLQvMuGOz7dI4H7nM
X-Received: by 2002:a05:6214:1cc9:b0:88a:3b1d:2f70 with SMTP id 6a1803df08f44-8942e0c3442mr216662326d6.10.1768922076051;
        Tue, 20 Jan 2026 07:14:36 -0800 (PST)
X-Received: by 2002:a05:6214:1cc9:b0:88a:3b1d:2f70 with SMTP id 6a1803df08f44-8942e0c3442mr216661746d6.10.1768922075621;
        Tue, 20 Jan 2026 07:14:35 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e5e49f2sm109107766d6.6.2026.01.20.07.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 07:14:33 -0800 (PST)
Date: Tue, 20 Jan 2026 10:14:32 -0500
From: Brian Masney <bmasney@redhat.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gfx3d: add parent to parent request map
Message-ID: <aW-b2EmynhZlp0mZ@redhat.com>
References: <20260117-db820-fix-gfx3d-v1-1-0f8894d71d63@oss.qualcomm.com>
 <vlvp4od6ykhneabgtpln7vpyyfpfuilasbmbfu222zgspc2ppl@iuuzldtoejaj>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vlvp4od6ykhneabgtpln7vpyyfpfuilasbmbfu222zgspc2ppl@iuuzldtoejaj>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Mon, Jan 19, 2026 at 09:39:30AM -0600, Bjorn Andersson wrote:
> On Sat, Jan 17, 2026 at 05:54:47AM +0200, Dmitry Baryshkov wrote:
> > After commit d228ece36345 ("clk: divider: remove round_rate() in favor
> > of determine_rate()") determining GFX3D clock rate crashes, because the
> > passed parent map doesn't provide the expected best_parent_hw clock
> > (with the roundd_rate path before the offending commit the
> > best_parent_hw was ignored).
> > 
> > Set the field in parent_req in addition to setting it in the req,
> > fixing the crash.
> > 
> >  clk_hw_round_rate (drivers/clk/clk.c:1764) (P)
> >  clk_divider_bestdiv (drivers/clk/clk-divider.c:336)
> >  divider_determine_rate (drivers/clk/clk-divider.c:358)
> >  clk_alpha_pll_postdiv_determine_rate (drivers/clk/qcom/clk-alpha-pll.c:1275)
> >  clk_core_determine_round_nolock (drivers/clk/clk.c:1606)
> >  clk_core_round_rate_nolock (drivers/clk/clk.c:1701)
> >  __clk_determine_rate (drivers/clk/clk.c:1741)
> >  clk_gfx3d_determine_rate (drivers/clk/qcom/clk-rcg2.c:1268)
> >  clk_core_determine_round_nolock (drivers/clk/clk.c:1606)
> >  clk_core_round_rate_nolock (drivers/clk/clk.c:1701)
> >  clk_core_round_rate_nolock (drivers/clk/clk.c:1710)
> >  clk_round_rate (drivers/clk/clk.c:1804)
> >  dev_pm_opp_set_rate (drivers/opp/core.c:1440 (discriminator 1))
> >  msm_devfreq_target (drivers/gpu/drm/msm/msm_gpu_devfreq.c:51)
> >  devfreq_set_target (drivers/devfreq/devfreq.c:360)
> >  devfreq_update_target (drivers/devfreq/devfreq.c:426)
> >  devfreq_monitor (drivers/devfreq/devfreq.c:458)
> >  process_one_work (arch/arm64/include/asm/jump_label.h:36 include/trace/events/workqueue.h:110 kernel/workqueue.c:3284)
> >  worker_thread (kernel/workqueue.c:3356 (discriminator 2) kernel/workqueue.c:3443 (discriminator 2))
> >  kthread (kernel/kthread.c:467)
> >  ret_from_fork (arch/arm64/kernel/entry.S:861)
> > 
> > Fixes: 55213e1acec9 ("clk: qcom: Add gfx3d ping-pong PLL frequency switching")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Why didn't Brian get Cc'ed on this patch? I'd love to have his input.

Reviewed-by: Brian Masney <bmasney@redhat.com>

clk_alpha_pll_postdiv_round_rate() previously had this code:

        return divider_round_rate(hw, rate, prate, table,
                                  pll->width, CLK_DIVIDER_POWER_OF_TWO);

divider_round_rate() called divider_round_rate_parent(), which had this
code that set the best_parent_hw:

long divider_round_rate_parent(struct clk_hw *hw, struct clk_hw *parent,
                               unsigned long rate, unsigned long *prate,
                               const struct clk_div_table *table,
                               u8 width, unsigned long flags)
{
        struct clk_rate_request req;
        int ret;

        clk_hw_init_rate_request(hw, &req, rate);
        req.best_parent_rate = *prate;
        req.best_parent_hw = parent;

        ret = divider_determine_rate(hw, &req, table, width, flags);
        if (ret)
                return ret;

        *prate = req.best_parent_rate;

        return req.rate;
}

I coverted clk_alpha_pll_postdiv_round_rate() to
clk_alpha_pll_postdiv_determine_rate(), and that now directly calls
divider_determine_rate().

I'll look through the other cases where divider_round_rate_parent() was
called just to be sure there's no other cases of this.

Brian

