Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3815C3CA4BE
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 16:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773420888; cv=none; b=RHEy4+IWiBIuwM9ChjLWKaZJpSv0Urv2goeHHrMs2utdg95nw1XxwWs2CLVyHIZwSR9c7disAdjNiVrWOdq2vR3vomzqSbpUQNNVKE41P/3MhWRd/UdeLsUoDlbwsJ/Gnjg6Y99VdtevhW8l47sOt6mKXJepLGVIuGBSI8KuxTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773420888; c=relaxed/simple;
	bh=MYqtvmPMBbkzVH2cDaVgumHB6+1nChu4X6wiV57iB6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WE26Yto31SvDKp7V3XRkhSB6KEDvMNiCfLPI8bM5Nj3nTXxirPcdR1IEkc0njM6wOBFToJa0ex/89fqvg8diYbKwITBJrpgZdLM4prvLTNgbABbb2UNyGQ8tQEzt1svwlH2LkazIQu/GSkC/0q1rUwvmCeqYbVRdSpxQmdGrC0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fyHUVu4M; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=R+xuJulT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fyHUVu4M";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="R+xuJulT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773420886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mqxWsYIPaTBPPrjermq+DtfpUjguE2xkVbOTdTjdzII=;
	b=fyHUVu4MrGC9v131WWUqGCumhybap81RRWxYQzvvBfQV8hNaQvogc5DuwzlUhA50PhnS1r
	ZToi3Iz/JyHOZzYYonakFtuoGqQ621g23/70UzqrtRPOm540/J5qvRnX4j0GtobDzVZlrj
	SkbwJMV/yM6O5tNqKWOzVAL4FWFepbM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-WNhIDrvQOK-h0fLERofQqA-1; Fri, 13 Mar 2026 12:54:42 -0400
X-MC-Unique: WNhIDrvQOK-h0fLERofQqA-1
X-Mimecast-MFC-AGG-ID: WNhIDrvQOK-h0fLERofQqA_1773420882
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5090cc6a7d2so180387421cf.2
        for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 09:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773420882; x=1774025682; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mqxWsYIPaTBPPrjermq+DtfpUjguE2xkVbOTdTjdzII=;
        b=R+xuJulTdn4NVCcS6LekFfD5KIiNQk0gPD+plDlLjhm372BUytkcDv7oinoWmOmzcn
         Kaglql4V+pLjmSD1oPJILoXyS+1ey7+rUgueVnWxRNuI565XpEojHRHcwJWa9KQTBHyt
         92sxI/sTPtsWFSuzMHSm22Hlv1n8vLPK2t3HohyDZMCdUwvfkzUIY4Q7hGa0+dBBDHcq
         HMKjOlSlqjVvFV10rIP0SAbXFOVT2moFbjOwDk434Qpexf50+Wf95rgrgpqedHuApf8a
         zoqaFysBcAGR9rxQ/od2jdjOgPqJDCKliiYvudqwMo4HdghjkNh12CfbvccmOkF3FLsA
         TaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773420882; x=1774025682;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mqxWsYIPaTBPPrjermq+DtfpUjguE2xkVbOTdTjdzII=;
        b=ry7tS5ErLDuQ87r90vmA0T+5Kt80t7jv/o+w1TulKPBhgDzDw3e2s691/eAoYaVR5a
         zCUaJhH9990A6RhCFYEtaTBaUGq4tNGBbQc7vrQ0oHVDZy90cU9H4TxVZ7kazwuiQ/w9
         /SbvQG2otJRfQ5n3ZnrCFjMikiYWv4978vj8+HNaShK2XyeEciB6HuSkrcJyOmeu8Amy
         ZHBrqd0/cWn9tj6uVWR1he4G9M1aqupZ4eofs8eN+IQJrxWeR6wyUw4u2PIgHPTKlt5H
         4p20Lvy/7ywjLsOfOTQMpPMi05CbSibV5SA62KKRvgQZ9RdUroPDcadONjHMrWvNs608
         RPMg==
X-Forwarded-Encrypted: i=1; AJvYcCVXmGE+mwLZfY6bcZWfz3VBxyODQSK3AHixmu9piZW7o45FsnoEVG0fYPSjVLFaRBcgphqejTV90Jc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQWxWCdCfJ4o31L9+OsUToEtsBCGl8t008e/PGDCfyr6/wIBln
	owsq5PTX4CxN8cxR7s8aKSKWohzKzJIETkVgNFp72meHMAOXpK3Qgxf0wgVOgtK9+Bq+Tk+xUQJ
	oRPKs1cxb4Z+2SCyxrkDdySYqpFeasQ3NtoNlQRtOpo3MQLMUBtdZWzDn+xCNqA==
X-Gm-Gg: ATEYQzxk+IGXMNtlYfEnJZCSLphdoHjV6ZXhdKJAKtlE6kxyddWQMMk7gBRfoqrGXNR
	oAH4cUXMQ2W89iJ/lYs6BaOUDIgdmjEJJrHz1V0Qdvo6Lvbk3jjN/pQBeSs3nQQx8qtk8py9FMg
	NtOeflOIv7BjiWUnv7g46vL2flZC9RXoCP2mupeu9n1TXytYxfe7YzdJobzvzMckw98ONoGSu9h
	Hq93gyTIWjdm7728Z6LQxvakkWN5xPFo3yz5VZTsbhNLYLh8/Mj3F/JxXw79DT4pMPMRvIBQ/U8
	mO/LZ3dEf7i6tk/MJbSIcvH6+vJAlESk/j3J03SmoS6QmcEz4Q+kkXIrurPv6oAtoupp5WdW+08
	gWRYVdnpPrFS7mdpIrmuKmrctQV0C9Ntwamk7Ugu2SlLJrJ+3Oe3DOyFY
X-Received: by 2002:a05:622a:4e:b0:509:1c5e:1062 with SMTP id d75a77b69052e-50957b88869mr55996841cf.3.1773420882166;
        Fri, 13 Mar 2026 09:54:42 -0700 (PDT)
X-Received: by 2002:a05:622a:4e:b0:509:1c5e:1062 with SMTP id d75a77b69052e-50957b88869mr55996521cf.3.1773420881696;
        Fri, 13 Mar 2026 09:54:41 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65ce3924sm60581406d6.24.2026.03.13.09.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:54:41 -0700 (PDT)
Date: Fri, 13 Mar 2026 12:54:39 -0400
From: Brian Masney <bmasney@redhat.com>
To: Pengyu Luo <mitltlatltl@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	White Lewis <liu224806@gmail.com>
Subject: Re: [PATCH] clk: qcom: dispcc-sc8280xp: remove CLK_SET_RATE_PARENT
 from byte_div_clk_src dividers
Message-ID: <abRBT4niX2CB9XVR@redhat.com>
References: <20260303115550.9279-1-mitltlatltl@gmail.com>
 <d2cdaa7e-1a17-4e6b-879d-266844958410@oss.qualcomm.com>
 <aahGtIkxtNPeeWKc@redhat.com>
 <CAH2e8h5oHvaADPgE_GdPQsWrU00XUT1d0ktbE25ztMeBEE51Yw@mail.gmail.com>
 <CABx5tqJ_spoZrhX7n91rTOaMcp1G_n8jB5aJV-rNbSPYZBZxEA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABx5tqJ_spoZrhX7n91rTOaMcp1G_n8jB5aJV-rNbSPYZBZxEA@mail.gmail.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Qualcomm Folks,

On Fri, Mar 06, 2026 at 06:27:20PM -0500, Brian Masney wrote:
> On Wed, Mar 4, 2026 at 10:08 AM Pengyu Luo <mitltlatltl@gmail.com> wrote:
> > On Wed, Mar 4, 2026 at 10:50 PM Brian Masney <bmasney@redhat.com> wrote:
> > > On Tue, Mar 03, 2026 at 01:10:43PM +0100, Konrad Dybcio wrote:
> > > > On 3/3/26 12:55 PM, Pengyu Luo wrote:
> > > > > From: White Lewis <liu224806@gmail.com>
> > > > >
> > > > > The four byte_div_clk_src dividers (disp{0,1}_cc_mdss_byte{0,1}_div_clk_src)
> > > > > had CLK_SET_RATE_PARENT set. When the DSI driver calls clk_set_rate() on
> > > > > byte_intf_clk, the rate-change propagates through the divider up to the
> > > > > parent PLL (byte_clk_src), halving the byte clock rate.
> > > > >
> > > > > A simiar issue had been also encountered on SM8750.
> > > > > b8501febdc51 ("clk: qcom: dispcc-sm8750: Drop incorrect CLK_SET_RATE_PARENT on byte intf parent").
> > > > >
> > > > > Likewise, remove CLK_SET_RATE_PARENT from all four byte divider clocks
> > > > > so that clk_set_rate() on the divider adjusts only the divider ratio,
> > > > > leaving the parent PLL untouched.
> > > > >
> > > > > Fixes: 4a66e76fdb6d ("clk: qcom: Add SC8280XP display clock controller")
> > > > > Signed-off-by: White Lewis <liu224806@gmail.com>
> > > > > [pengyu: reword]
> > > > > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > > > > ---
> > > >
> > > > Looks like more platforms have this issue.. thanks for fixing this
> > >
> > > I hope within the next week to post a new draft of my patch series to
> > > keep certain clk rates intact when sibling and parent rate changes occur
> > > [1]. This will be for certain critical clks, such as the ones used for
> > > DRM and sound. I have it working with kunit, and just need to clean up
> > > some of my new clk helpers and commit messages before I post a v5.
> > >
> > > I'd like to test this on some real hardware and I have the Thinkpad x13s
> > > with the sc8280xp SoC. Can this issue be reproduced on this hardware? If
> > > so, can you provide me detailed instructions about how to trigger this
> > > scenario?
> > >
> >
> > Quick answer, no, x13s uses a edp panel, not dsi. This issue is
> > related to dsi clks.
> 
> I posted my latest clk scaling work in an attempt to address the
> underlying issue here.

Ignore my previous patch set. In my v6 that I just posted, I updated
clk-divider.c to support the new v2 clk negotiation logic. The
clk_regmap_div_ops uses this driver, so you shouldn't have to make any
code changes.

Anyways, would someone from Qualcomm be willing to test this? The
procedure is fairly simple:

1) Back out the patch:
   clk: qcom: dispcc-sc8280xp: remove CLK_SET_RATE_PARENT from byte_div_clk_src dividers
   (or one of the similar patches posted for other SoCs)

2) Apply my v6 series:
   clk: add support for v1 / v2 clock rate negotiation and kunit tests
   https://lore.kernel.org/linux-clk/20260313-clk-scaling-v6-0-ce89968c5247@redhat.com/T/#

3) Boot... everything should behave the same as prior to my patch set.
   The clk crash will still occur.

4) Reboot, and boot the kernel this time with the clk_v2_rate_negotiation
   kernel parameter to globally opt into the v2 negotiation logic. The clk crash
   hopefully shouldn't occur.

Thanks,

Brian

