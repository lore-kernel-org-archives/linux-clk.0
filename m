Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BFE371071
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 15:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784908083; cv=none; b=Ow1aCqPPeNZyvB1n9zVYsfkhHLjECy6aai16uAvPBmsEterksyi1FrRT0iUlaz61BGxWntDO/CWhQGXs1QHy3om2SUtYPvbmqdMSd/cQ0AfpcjxzzIzD+UDd93nDSSFwkwYI53VkVWrN4CxQEJszM1OnMn3vIC1lBXZnOvbhlqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784908083; c=relaxed/simple;
	bh=cn+x4dya5aJWGTuEtKwknI0NaktEbB4OB5mtal3SK1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=be7ppkL2CRxsSeJ+xPreCp2y67tOgybz03aNqplDcOEo30Wr/SlVKkov1V73M/egNxpBIk6Un5h9Je8t3Qddayjc0B5Wya9TrhJGqDim1HZp+7y5E5vLkI5gGDWIkcryAsR52U8siIZakWk3UwZY7X+OZc/MAV9fSVo8/DR8vBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YLbDWYdx; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=YVZ745c+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YLbDWYdx";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="YVZ745c+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784908081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4ffI7ELCJU7nRGshcHwyrN09W4Ca8x2m7UfWZqlGMYM=;
	b=YLbDWYdx+cHL6smdObAIFrxkUx4C753z+rtWyccWosDkR9RsqqNT1zuU1JTSmnyt2/Q9wN
	h/7wIz1+2mYrTAQv6x7ni1Ku4NxVV9nZdQ0fngISoutp0tF06ukMus4dyU35TwS+M+r1nD
	IAvIPJ2UznKEoQtb/SxkXija7eVuHiU=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-dmUKmgvvMNuMdwrva00t0Q-1; Fri, 24 Jul 2026 11:47:59 -0400
X-MC-Unique: dmUKmgvvMNuMdwrva00t0Q-1
X-Mimecast-MFC-AGG-ID: dmUKmgvvMNuMdwrva00t0Q_1784908079
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92ac0a54110so96608585a.2
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 08:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784908079; x=1785512879; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4ffI7ELCJU7nRGshcHwyrN09W4Ca8x2m7UfWZqlGMYM=;
        b=YVZ745c+aSt7+gGFACWJZgaHVwXyQWbU0w15c+0nV6mglhT/UMtJYhuuDFc3Dk1CWd
         B2OKZpyGiNRRnE5wR6XOdy6hSCxth3pYEU6DARxSZaLooHyVJvDQp70OKelG8L+jqAVV
         9g/AW3sTGXo2fpHrpqBGF8f/DMzJKE4O9Z35w4F4vWo2Lch7IJe4LbFoWOQTARGObwJC
         r3Q71+EfX9sNAOu2VNcgRNCPyaZ+9SMdHRPF+2czn04b7yEdRtgSljPWCWrxrxA4Qvyx
         IviPAbDdvpkB13jnqmsDnvKnyzX7mUNKL3DA7dwWdn6vCc2C+JOy+7BFpRU8UT3ajNO+
         fHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784908079; x=1785512879;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ffI7ELCJU7nRGshcHwyrN09W4Ca8x2m7UfWZqlGMYM=;
        b=i32EiC+8pfLJLqIe4DufPK7zsrt4xdcSvjOgisGPzRqV/sFQuWqWeg2jexE4DWk30K
         b/kWpzhrnoYK1mIw2/NnGR4+Q/bWaoODoPzNZi5WXY9luPkhJUndY9aQ2iNf+QEYCBe5
         +kuv/HLIcbDiGklmTepVO5r2fQxo16kHNJqzuw839d5LKdNA20g4Vx3Ep/YER06N3ZCd
         lUTejuM/Pl07NyM/BqHFuDK6qLGV0biMt6pTY+qpi/+03YLRxHYcEl1pzQYCN6Zn5UP1
         uTO4j17oO+gja+OdTbWTw+qC83Hf5xzcKB4iruWnd/Uyvftp/G0Ss4LXdYVBtDofCNiA
         wiNA==
X-Forwarded-Encrypted: i=1; AHgh+RrT3v7ltJbNS+0YKlMXx+Bb+a+e+YLCFfCzEgjw2oQT+TOzVrMGh95XdtIAv1XrNL9ajHrHc8YfkPQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4mtqJKPh3HRojr5GV8fZyt7I+7EBTngtvwf0R5nJPN7PB4c8W
	uUoiWHjUjniu+XT28cjW5nvREw20xom/xSRVE6cRC5jZSWZn9iqVFEvZmG+zXhxythzYtg4dDsJ
	6Tmr6YgHrijhw74ScUOTIDYZ6QBxYcKM2Baa8Zp5cSREXi0lNc5NyuTAlCL7OlA==
X-Gm-Gg: AR+sD12AUsJ4oaWuXl9hPmTnRR4xzf4vyqQFJxMgPQSvj2jdPKW6/QswGDmcRDSoDfL
	1JN2VlvbHm7qyGLGjBP3Bbq1s3N6V0GsPy0Sc+4BV6Mti1XE0QgEn7HydADFqAADBli/yPSVGaS
	VfgWTI9JmO1Ynw1fRFSzqrYDWFb81Pt5J5vS1GLS9imTxzo/EWDZwRxAOd1JId2smi1DR7ZIw3S
	vZ7CNVOvQ4O4ciuZWLUmXYplcXAAwTgc9+8xffdY9q3MwKLtJPIGTiiTf+OLRaNTZzn10dhIIZ3
	L/5O8alTuSUmB4iOUUoza4QhZk984Q2KwvgYQ52tZgeEVoGG5/p3dHDXPMJkut0g9vwjUzxwf2T
	aaRTS4tJk2RFynf1eXatpBNnWgGOJ78FWdEo=
X-Received: by 2002:a05:620a:4690:b0:930:b4f9:f327 with SMTP id af79cd13be357-931038a7d95mr809454885a.33.1784908079147;
        Fri, 24 Jul 2026 08:47:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4690:b0:930:b4f9:f327 with SMTP id af79cd13be357-931038a7d95mr809449885a.33.1784908078506;
        Fri, 24 Jul 2026 08:47:58 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f6ac3e5esm670750585a.47.2026.07.24.08.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:47:57 -0700 (PDT)
Date: Fri, 24 Jul 2026 11:47:55 -0400
From: Brian Masney <bmasney@redhat.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] clk: fix self-consuming provider module pinning
Message-ID: <amOJK32FN5sNIGlA@redhat.com>
References: <20260723-clk-provider-pinning-v2-1-8dad72eb79f0@baylibre.com>
 <amIn3DO_65uyItS_@redhat.com>
 <1jbjbxd4fk.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1jbjbxd4fk.fsf@starbuckisacylon.baylibre.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Thu, Jul 23, 2026 at 07:03:11PM +0200, Jerome Brunet wrote:
> On jeu. 23 juil. 2026 at 10:40, Brian Masney <bmasney@redhat.com> wrote:
> 
> > Hi Jerome,
> >
> > On Thu, Jul 23, 2026 at 03:00:51PM +0200, Jerome Brunet wrote:
> >> clk_hw_get_clk() lets a provider get a struct clk for one of its own
> >> struct clk_hw.
> >> 
> >> When a struct clk is created, the module usage count of the provider
> >> is unconditionally increased. For a self-consuming provider, this means
> >> it pins itself and the module can never be unloaded.
> >> 
> >> Increasing the module usage count should only be done when the consumer
> >> lives in a different module from the provider. Use THIS_MODULE to
> >> capture caller's module and increase the module usage count accordingly.
> >> 
> >> It is OK for consumer-only APIs such as clk_get() or of_clk_get() to
> >> pass a NULL owner. As a result, any provider module will get pinned,
> >> same as before.
> >> 
> >> Fixes: 30d6f8c15d2c ("clk: add api to get clk consumer from clk_hw")
> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> >> ---
> >> This issue has been present for a while. Virtually all users of
> >> clk_hw_get_clk() are affected. The majority are compiled as builtins
> >> according to the defconfigs. It is not problem in this case but it is
> >> if the configuration is changed to module.
> >> 
> >> The following modules are using clk_hw_get_clk() and are compiled as
> >> module with some shipped defconfigs:
> >> * drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
> >> * drivers/phy/cadence/phy-cadence-sierra.c
> >> * drivers/pwm/pwm-meson.c
> >> * sound/soc/codecs/lpass-va-macro.c
> >> 
> >> Currently those module cannot be unloaded once they have been loaded.
> >> 
> >> """
> >> rmmod: ERROR: Module blabla-module is in use
> >> """
> >> 
> >> With this applied, we can get back to removing the direct usage
> >> of the struct clk in struct clk_hw and eventually remove this
> >> struct member entirely.
> >> ---
> >> Changes in v2:
> >> - Update comment in __clk_register()
> >> - Add missing documention for the new parameter of clk_hw_create_clk()
> >> - No functional change
> >> - Link to v1: https://patch.msgid.link/20260721-clk-provider-pinning-v1-1-63db2e667993@baylibre.com
> >
> > Reviewed-by: Brian Masney <bmasney@redhat.com>
> >
> > This looks good to me. I'm planning to send Stephen a pull next week for
> > content that I think is ready during this development cycle, however I'm
> > not going to include this. I suspect he's going to want a kunit test for
> > this and I know it's going to be complicated. My suggestion is to post
> > some kind of rough test scenario for this, even if it's initially not in
> > kunit. As I get some spare time at work, I can help you to see if we can
> > get a kunit test together for this.
> >
> > Brian
> 
> I understand but I'm not adding an new API, I'm fixing a real problem in
> an existing one in the kernel now. The related API is already used in
> some kunit, so there is some coverage already.
> 
> The problem was known (as the comment in __clk_register() was showing) and
> there was no kunit then ... so it is a bit strange to delay fixing the
> problem because there is not kunit associated with it now.
> 
> That said, I'll check was I can do. acutally loading and unloading
> module in kunit does not really feasible. Maybe poking the owner
> field with __clk_hw_get_clk(). This is not really supposed to used
> directly (which is why I did not add the documentation around it)
> and it's bit fake but I do not really a way around it.

I agree that it's fixing a real problem, and also agree that a kunit
test for this is likely going to be nasty and overly complicated. Let's
wait and see what Stephen says.

Personally I think we merge this right after -rc1 is released to give
time for additional testing in -next.

Brian

