Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83A02F12D6
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 19:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760989010; cv=none; b=ppzRsqD0d2JvSJS/uRAs5Eg5F9Qie7uvF2fGF5Ug+mYeNYd+ubghmwbVdjiTvkA04E5uBjagSgUjV3SjrEeX+oK+DbEGNw92285kiygH0p2UwPd0PtxFE+cGI1geFtZ47+/84yObB9FSfua6gNA+JiDTeaBaJ/e2mZ7ZvUOUC3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760989010; c=relaxed/simple;
	bh=HXS7xGymDI6/8nnlFWj0A2HLQl6SA7kHsV+2dlr/xeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HpKNsA4gsfCeh0mZfvQkzdnoqoqaQvkoRlt3PH/Qpip8Peo1OQjVO18f/QiNi2iXyxhWtvK8jnvReBC8PJg80hghkfJecMv6jE3Ki4+YXS3goPBbGQ0vEyTNaP4b4P1Yfs/KH/8AGgYD8wDrXJJkRGisK14uYFdHXSWNGfmAzKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d1TNzonU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d1TNzonU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760989006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5ZiaSM2PnoC+EdbhzADV84+t+uutkx1Amp/dmBBeJxQ=;
	b=d1TNzonUBAde62H0OVgA4jWkMEQ81nb85H3I7Xxpf6sX2scMbRlfgpCJPWz7iD9iC5Qc+9
	mG8IdKEdpEbfq6t+Lt4a9v3s9cgyVsuOigkMFGIYfaPgD/gP72rudioKUw1uPUiJsTu+pT
	S/a/GJqElD6TOByQyd2R0x1snQ1OzM4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-exEVI9o6M_yrPAkwNjdPTQ-1; Mon, 20 Oct 2025 15:36:45 -0400
X-MC-Unique: exEVI9o6M_yrPAkwNjdPTQ-1
X-Mimecast-MFC-AGG-ID: exEVI9o6M_yrPAkwNjdPTQ_1760989005
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-827061b4ca9so1487501185a.3
        for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 12:36:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760989005; x=1761593805;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ZiaSM2PnoC+EdbhzADV84+t+uutkx1Amp/dmBBeJxQ=;
        b=uHlXDQSOwMCdskCqvfzESJZcsBBmhJbGyOR+iJxLik/vkqG3SH284yZ0f+8Y0Q5LjQ
         Yhvr3iDQs+g7qedZiNwklyj4E7TwMp5MnqVyLIHYd2NwhrLmKJZr6FXh1fdYWwPq9JHE
         kWhL5i6bNM4aH1XSOCqj6IIsFJVRWWKDQJWmLIxO+Vq+Cm6OuDaAuHmofVEZVJkpdOjW
         PaKL/i4AOmzAxoi7V9p3Ul0W9HJuySB2eifu0TgEgi4KEaM25L3AECX2OpR8GsVoeLvF
         UjBNXuo99l6Q6MQTF/kjE/O4vUPMulyEUAR7Haae9ch+e/IzYEGqhY1JtwRBS/f4Ayai
         JMDg==
X-Forwarded-Encrypted: i=1; AJvYcCXDHDyYGJGYh1EBClPwwZeh+nhm9XJDKKg+ORNZD4+Me/4/IhHNy0BtYhW6Dq2z4gLHNkXE8y+CXi0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyitPtE2mAjBKnRB+DNRqW/YFysoxoDq+j1gd33WsTP+mJ2E1t
	ZilEZXL1Ys+gXBuxmqFVCqT4o62SbToJHNpEWlyqAq5GPfb4qGOCTHh8b7p1ljYtA6HaDIS1LxH
	59zFeHv002ehygN+TpeGFDhk40jN8qmP7XHYcLyyYdsxWUklmqVbVzW2t809aMA==
X-Gm-Gg: ASbGncv9SNq5N/3Mw9/flmZMX0IdUdZ/XOIY6FpW4XIB7beQn6jSoBTGuiWeoyrBJOU
	GRLMQK3AdAvvmgWJpMlu6Eza1sQZ31ORwaa2WM5VbCXZDQ1ZKXcJsH6f42SSyHpz33LkI8yxqh3
	eFmRV+g0wzr4tx8gbfoZN/ex+xyJUion8ejdUU/fiY4k/FqWtXNMuA9UFzHw8Ij1kXurc1R94G1
	eqjF5peFFpYXuGL1vHTRWVnI+sPsB7Qm807x/wydgLJh9H4fyVjXqxfYaRrH3keFuSLvV9rwC6y
	UzduaCPMNDmhph/xFarGdA17RBLuaCPXgHRWit1joBDiljIwrkG0Jc8e4raPjfpYhwcdYa595hX
	dJUtOEtnPWhcKaOm4jSIU5j22l/Di6A==
X-Received: by 2002:a05:620a:372a:b0:859:be3b:b5ac with SMTP id af79cd13be357-8906e7b97famr1467032985a.4.1760989004784;
        Mon, 20 Oct 2025 12:36:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsNNiKmKY9peurhzlqev2tF6KISu0JNaKtgEbeRgj3Y5mOQwBz7wnSHOaZ0F5uLAZ7ugJitg==
X-Received: by 2002:a05:620a:372a:b0:859:be3b:b5ac with SMTP id af79cd13be357-8906e7b97famr1467030685a.4.1760989004383;
        Mon, 20 Oct 2025 12:36:44 -0700 (PDT)
Received: from redhat.com ([2600:382:7726:4296:a56e:fe07:ce3f:d5f0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8924e082780sm537713185a.51.2025.10.20.12.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 12:36:43 -0700 (PDT)
Date: Mon, 20 Oct 2025 15:36:41 -0400
From: Brian Masney <bmasney@redhat.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
	kernel@collabora.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/5] clk: Respect CLK_OPS_PARENT_ENABLE during recalc
Message-ID: <aPaPSeClhiq2WYJN@redhat.com>
References: <20251010-mtk-pll-rpm-v3-0-fb1bd15d734a@collabora.com>
 <20251010-mtk-pll-rpm-v3-1-fb1bd15d734a@collabora.com>
 <aPFbDl_JKyDay1S5@redhat.com>
 <3342669.irdbgypaU6@workhorse>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3342669.irdbgypaU6@workhorse>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Nicolas,

On Fri, Oct 17, 2025 at 02:21:55PM +0200, Nicolas Frattaroli wrote:
> On Thursday, 16 October 2025 22:52:30 Central European Summer Time Brian Masney wrote:
> > On Fri, Oct 10, 2025 at 10:47:09PM +0200, Nicolas Frattaroli wrote:
> > > When CLK_OPS_PARENT_ENABLE was introduced, it guarded various clock
> > > operations, such as setting the rate or switching parents. However,
> > > another operation that can and often does touch actual hardware state is
> > > recalc_rate, which may also be affected by such a dependency.
> > > 
> > > Add parent enables/disables where the recalc_rate op is called directly.
> > > 
> > > Fixes: fc8726a2c021 ("clk: core: support clocks which requires parents enable (part 2)")
> > > Fixes: a4b3518d146f ("clk: core: support clocks which requires parents enable (part 1)")
> > > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> > > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > > ---
> > >  drivers/clk/clk.c | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > > 
> > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > index 85d2f2481acf360f0618a4a382fb51250e9c2fc4..1b0f9d567f48e003497afc98df0c0d2ad244eb90 100644
> > > --- a/drivers/clk/clk.c
> > > +++ b/drivers/clk/clk.c
> > > @@ -1921,7 +1921,14 @@ static unsigned long clk_recalc(struct clk_core *core,
> > >  	unsigned long rate = parent_rate;
> > >  
> > >  	if (core->ops->recalc_rate && !clk_pm_runtime_get(core)) {
> > > +		if (core->flags & CLK_OPS_PARENT_ENABLE)
> > > +			clk_core_prepare_enable(core->parent);
> > > +
> > >  		rate = core->ops->recalc_rate(core->hw, parent_rate);
> > > +
> > > +		if (core->flags & CLK_OPS_PARENT_ENABLE)
> > > +			clk_core_disable_unprepare(core->parent);
> > > +
> > >  		clk_pm_runtime_put(core);
> > >  	}
> > >  	return rate;
> > 
> > clk_change_rate() has the following code:
> > 
> > 
> >         if (core->flags & CLK_OPS_PARENT_ENABLE)
> >                 clk_core_prepare_enable(parent);
> > 
> > 	...
> > 
> >         core->rate = clk_recalc(core, best_parent_rate);
> > 
> > 	...
> > 
> >         if (core->flags & CLK_OPS_PARENT_ENABLE)
> >                 clk_core_disable_unprepare(parent);
> > 
> > clk_change_rate() ultimately is called by various clk_set_rate
> > functions. Will that be a problem for the double calls to
> > clk_core_prepare_enable()?
> 
> I don't see how multiple prepares are a problem as long as they're
> balanced.
> 
> > 
> > Fanning this out to the edge further is going to make the code even
> > more complicated. What do you think about moving this to
> > clk_core_enable_lock()? I know the set_parent operation has a special
> > case that would need to be worked around.
> 
> __clk_core_init also needs special code in that case, as it calls the
> bare recalc_rate op with no clk_core_enable_lock beforehand. It's also
> wrong, in that recalc_rate does not necessitate the clock being on as
> far as I'm aware. (if it did, this wouldn't be a problem in the first
> place, as enabling it would enable the parent as well). Changing the
> semantics of clk_recalc, and therefore clk_get_rate, to also enable
> the clock, would be a major change in how the common clock framework
> functions.
> 
> In my case, the __clk_core_init callback was the one that crashed,
> so it really needs to happen there, and I really don't want to
> refactor every location where `CLK_OPS_PARENT_ENABLE` is used for
> a bugfix just to avoid potentially checking the same flag twice.
> 
> Having `CLK_OPS_PARENT_ENABLE` cleaned up such that every clk op
> that has potential register access is never directly called by the
> clk core except for one place, an accessor function that does both
> pmdomain and `CLK_OPS_PARENT_ENABLE` checks, would be nice, e.g.
> by keeping the clk_recalc change and then having __clk_core_init
> call clk_recalc instead of the recalc op directly. But then the
> __clk_core_init logic needs further refactoring as well.
> 
> I'm not sure I want to do that in this series, because it's quite
> a bit different from just adding the missing check and parent
> toggling, and has the chance of me introducing subtle logic bugs
> in what is supposed to be a bugfix.

I agree and that makes sense. Thanks for the explanation. What you have
is a good compromise.

Reviewed-by: Brian Masney <bmasney@redhat.com>

