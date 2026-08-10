Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB154248AE
	for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 17:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786382290; cv=none; b=unSRaymWO1/FDzzajyv1bh6eQEMODBs/V6ji2sDk7XvUTE/eUWRrAVkDLaTfpxo1znIrM2lyeZJ8/xMPGQMSJZPKCE5rGoqffRmxgfdIAAQXJiEMRpLDG6lhaU4ZH8m4RiDnVVRFD0Ee+ZjGLCsSzxV7p/smmN2SkoSNfenepeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786382290; c=relaxed/simple;
	bh=Ci1XaFzRBv/qpXZwP21pNljumVkUJ79fkDCBQF3hafY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YD58t4UJgR6pGzEEc8ACFbuZ03bPlshPsca2u21l+dOBky/hskYntFJVmWNL1QrOcJxQ3c+ovOcyogAt/Lnvak4s/vS56TUdbAgXmRG7OoP0KrE44IOKO1LmXhOrLp5Q2m8IIMpR0f6waOY1YxDC0/T/uzQ6I9uRHhE9T2oIy7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GCl5mH2m; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=GURWFDTG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GCl5mH2m";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="GURWFDTG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786382287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e60Y2Hd3VNcQx2rW0XYN6hHI/hSb69wpEJYZUkdU7+s=;
	b=GCl5mH2mTn47kCK15mVZfVLNxjc//cAF6wkQAeQ5UjIrbX2yWS9+ZXw7/tOB6W8H2MW5jJ
	pNTaLgFEfrY0//j2y/Em9OmAW1JVIShmdx3KMzjaFx27gdXXak4qnELoP8kkFdL7OUGZ3U
	X83WFBDYxUbJK8sUp3uqRWHdonHo8lQ=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-5L9_wGLzP_Os9-MAO1ytFQ-1; Mon, 10 Aug 2026 13:18:04 -0400
X-MC-Unique: 5L9_wGLzP_Os9-MAO1ytFQ-1
X-Mimecast-MFC-AGG-ID: 5L9_wGLzP_Os9-MAO1ytFQ_1786382284
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81bee860fb7so60668527b3.3
        for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 10:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1786382283; x=1786987083; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e60Y2Hd3VNcQx2rW0XYN6hHI/hSb69wpEJYZUkdU7+s=;
        b=GURWFDTGvgT30MQrpSXGvQZDNOABmGM9oisgnhPVRWDDWr4oN4uHw1iogZk3FFpYwW
         iqNw1TInkvObjLwafSW0YVCkfiHuyBqAydLHpg9Wlfspjc4PHRLtUgcaItbBsS8DggCd
         sgnu3ULyCMK5eNT2Z8qHhUzzUE+5LbKWm4KPpY34LChoyA56rKaQ9bSWHffb8iMx8QkF
         POfTQylPKN+atiRgE5N0ivHb6Ha6It+MlZTBRO/odCEN1T74xdCpMpaU/Bt6U8B8z0yK
         4792Jg65k+jdshQFgWJFuVpD6Y99tH59dDk+8ORv0OXu2pdfe0vZOGtRMZ96bBKgKB1e
         QH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786382283; x=1786987083;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e60Y2Hd3VNcQx2rW0XYN6hHI/hSb69wpEJYZUkdU7+s=;
        b=ieKPbi8GYkewVgCF102Icg/eHEW0G0akt497hZgfKhenE+okmPTuhmlLrXz3ja/PIT
         GqZuKv2w6J+hyDAhP8t2jNqCRGKYoFLH+WAK+EEZoOHgK7NM2pyickDyVMKAL3/nt4JN
         GBqTJzpxhdMjN6DrkwsFJVQZUSnI5oktNHXIJEC0gmRhy0E9KDrg2cs5Dxo4EE2rTsqE
         TNOZaePu5tWy/APNvNnj73KPo6MpDuhLhMJGepj+3dht2w46hl2gEPSewJeE0euIfO0x
         soi++ri8R5tbZc9q+84eO1uKtSIaK1LKCzLZG743iWw8sJJEbu3pVzN4ApW5eQbCaCkA
         yzrA==
X-Forwarded-Encrypted: i=1; AHgh+RpKeMgwiH0+YD2fiyK1expFQ0AkUKPhuDucqfsn2TrGeAHiko8IjxwBl8LxQt6WeeWzcCHIucQ3wx0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSmBT+yCelVI1Zuk3YGRu6/nPWMkWVKYYBmxULeQmdSJUPIs2f
	At7YYxdP8gEMuQvDtk9zEMenni0Cvf7sHHocuFuSwnbCT7g8XcDNswrULk7wYgL86fzSVUeKsBA
	3ihJxoJot9ZfN+3SsGEKQAmGyoGilzmRWqHQKaWdjvQvB22+b0L8sNUG1EOBnLw==
X-Gm-Gg: AR+sD13Z7SFh+7K7T1OW43CWKqOgF3/CfzHPVGn8rFlRAwmFmfD+Ozbn2k4vjs5ou3c
	r6X8rdqMQz8YDf2wcvz2d99pB/TSVV5ny7cBcZr12vtUxRitufXO1LDEsVC7Z0wCcctoX0XUo1L
	nl+gG3agG2nkFNZJ6DyqZ+ZtKlFiFnbbJ4v27qacviUTXOTLQv2p2JFRCAjDviuFdTRGz10tAfq
	dWlhdnASdrYyyy5BjCRI1+AjKloXBgVeiLPVTe3mu5K84RJQzjrR26fnQmn32QZ7b2hQPVmPYUr
	XzyPgNrVbHFAlmzxYtDrip7a4gz/fUwRUTk80bmcBbfsGPS8EuPDIYUtkq3pcTI+Y7cIJ92C4Aj
	ZW9PK57MmnpEX6xpLE6WwhLdSG7VJz6mbwDU=
X-Received: by 2002:a05:690c:9a84:b0:81e:bd02:b02c with SMTP id 00721157ae682-825728d1963mr135364537b3.1.1786382283695;
        Mon, 10 Aug 2026 10:18:03 -0700 (PDT)
X-Received: by 2002:a05:690c:9a84:b0:81e:bd02:b02c with SMTP id 00721157ae682-825728d1963mr135364137b3.1.1786382283255;
        Mon, 10 Aug 2026 10:18:03 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-823f75c1c17sm60279477b3.47.2026.08.10.10.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 10:18:02 -0700 (PDT)
Date: Mon, 10 Aug 2026 13:17:59 -0400
From: Brian Masney <bmasney@redhat.com>
To: Luo Jie <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
	quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
Subject: Re: [PATCH v2 03/12] clk: divider: Introduce
 CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET flag
Message-ID: <anoHx6sbVKn0GVlk@redhat.com>
References: <20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com>
 <20260806-qcom_ipq5210_cmnpll-v2-3-cce718b8ec17@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-qcom_ipq5210_cmnpll-v2-3-cce718b8ec17@oss.qualcomm.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Luo,

On Thu, Aug 06, 2026 at 11:53:07PM -0700, Luo Jie wrote:
> Some hardware dividers derive an even divisor directly from the raw
> register value, i.e. divisor = 2 * val, with no +1 offset. This differs
> from CLK_DIVIDER_EVEN_INTEGERS, which is one-based (divisor = 2 *
> (val + 1)).
> 
> Add CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET for this variant, updating
> _get_maxdiv()/_get_div()/_get_val() accordingly. _is_valid_div() is
> extended to also reject odd divisors, since _get_val()'s `div >> 1`
> would otherwise silently decode them to the wrong even value (e.g. 3
> -> 1 -> 2).
> 
> To avoid regressing rate requests that previously computed an odd
> divisor (which used to succeed with a silently wrong rate), round to
> the nearest even divisor in _div_round_up(), _div_round_closest(), and
> _next_div(), mirroring how CLK_DIVIDER_POWER_OF_TWO already rounds to
> the nearest power of two.
> 
> Also guard divider_ro_determine_rate() against a zero divisor, which
> can occur from an unprogrammed/reset register, the same way
> divider_recalc_rate() already does: WARN unless CLK_DIVIDER_ALLOW_ZERO
> is set, and return -EINVAL.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>

One of the other patches in your series says:

    The NSS (network subsystem) clock is derived from the CMN PLL output
    divided by 2 and then further divided by a configurable 6-bit divider.

Can you register a fixed-factor-clock parent with /2, then use
CLK_DIVIDER_ONE_BASED? That should yield the same results and it may
more accurately represent the hardware as well.

Brian

