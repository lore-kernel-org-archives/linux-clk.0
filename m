Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB0C45C6F6
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 16:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787587245; cv=none; b=n5Khg8Id7NL2T8AKMRnFNMYadQ8ye6Hq/x55JC+ItyA0ht1mDKCZTyNpggDogHGlrOt+JqyOABX93vUP34Tb4Z/W5DXZXjCfIA9MsTLU2aT5s+Lmch97I4N6NPaCL21G37P8RXv3C3APV4eLmcc0Y3iILeaSGhq0qEVgXpE1KSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787587245; c=relaxed/simple;
	bh=JDnNCm8POwOEh9r9Zuxavtl0AknyWidZ8VrOxDpaR+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yx0dYFsKDNKj0mIPxQeP5ZLgJwPzrFK2pP1Vf7Gc7tGvWf81RlCOyNN3Dhiq28W+20veK1oq83xRb4zTS1y5rve1fpsAI32jD3tzdEkhilhWpSas4t10FNAI4YvP9MAvp8PKjCbqhuKDFJ4H19EENpKRZXAKAhxJsz367+vb5RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AmpPvpTR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=T/W9s38j; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AmpPvpTR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="T/W9s38j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787587242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1hh+S6BT+/ZJJa40lL1O++OyyII1KUrPxAo2YLD9DsQ=;
	b=AmpPvpTRP2i7zVduBIimiOY64m12EHzB7LCCPoEnZTj9mFXNa+Rn0bdI418KM1vMYAcY+O
	2IT7sibrBWu4p4EZDL/EAXyK1e4TKnw8mWN9IbfxmbTKc47wlVtteLVqmJj7fMI1yM3Kjv
	bKJAcCvf2Ht8+Yg4+mESDSASZoI8Hmc=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-Fu0-0iCxOP-wEUe0zCVMgw-1; Mon, 24 Aug 2026 12:00:38 -0400
X-MC-Unique: Fu0-0iCxOP-wEUe0zCVMgw-1
X-Mimecast-MFC-AGG-ID: Fu0-0iCxOP-wEUe0zCVMgw_1787587238
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934956beec8so646113485a.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 09:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787587237; x=1788192037; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1hh+S6BT+/ZJJa40lL1O++OyyII1KUrPxAo2YLD9DsQ=;
        b=T/W9s38jJl5xjaU8A+YItIJzYplJdDKbMKG/x6hziHxMd/OC3hGZHsCJJt1ErhCFMZ
         Vefb7yCVqRftW+txE/Jc1Yd5+SlLLJaOST2v4KJnEQmZfWg3G9dF3MNQAR3yHbVw9hdh
         yoA8BSdZJNY10BDNXIcyqXHXO0pOBPjB0z3B7z1KOGNmt/7PIRhxPGwnVUKE8BG9lLkL
         lXpQhRC8onhmPdWaN8NTtuHQgCIjBofqx6hixeeG14o54z8ApKze4/LJKr1SSOEyTc85
         u4B/UKf48IgHumyaR/CNzuHKzCnfIrACgIHOoxHQLKFCey1ivPT0n+5Jx35iGVT85gmK
         FFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787587237; x=1788192037;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1hh+S6BT+/ZJJa40lL1O++OyyII1KUrPxAo2YLD9DsQ=;
        b=drLjoCNk1PmZOMQ0pVxlIFVLV+XO9uxTgpvwAfxNE3iHCBXFoZoA3R6Lrx/pxPrNdy
         3+41qI/AH1E3CwsVlqsFOMQU2xqtUe+oToxR/EbpYquP2V+5r/g/6lJZN2NWoqBVcDKs
         dcp4bkm/7YdqRlSQqokmN/w21/Aq0E0H/FnRHe/0xONai5njNG38g4Kk0zArJJeNNolI
         LNETLja4q6uRsjuWhwO9fFnQPog3P/k3lgPl5ed3LAQyQYby4qaZl0yccDkOu7Xw29QB
         TLbSkOVhaXI1G2vlSKECAxtpIb2sAl8/YSG7nOYxAnYEsyk195FwuKFtFQL9x/NAlREc
         qvvA==
X-Forwarded-Encrypted: i=1; AHgh+RpqmzYNbhE3S1ZK9i1erk8YQqXgPXdvfo9T/igZfcvKTQS4yJshCppx9oQ5FGxRlcPldg59k+m/0Tw=@vger.kernel.org
X-Gm-Message-State: AFuF++nbgIp9jKuloAhQZWvqn5jHAb5varCiSWZ+QFpWzgKb2ou2askR
	Efou7j9KP5GRcq78sbRfZd0pwB/PTHwATekAUe23zlo8RgEegnjzqLCW2O+CgwSB4SD3p+fiTsY
	7dhQuYxmYTBkzhxJRVfXdmhZf8gpfzzUbEaGRscmwSilX3Wlo/x86P0VwhR9RPQ==
X-Gm-Gg: AR+sD13Y0qDjE4+u4FL7ZzZCYDZ1GezthMDldNPp1guPGom/OXXwgbxQW4/SptVGmsR
	js2RNvGPcibgMKZtTpnn983lU8oA2MNiNGXoTQO3B9ptXIUSXYJhvrSpU4O9FBEpN8GZOqW9d8y
	ituhljelgq+rzfLVhYGB6vUsm9/0QD1mRXz1to9ZgfCDhNGFxifo1apE60wm7z3XnjqKDpxWBE3
	cDhbn5C5Y0fmLli8X8CYMaYEwGQkIExGF3PqXeZAXRMS679+lFoHtXAhgd10njoABnPpBWO5p+5
	LRjLqQPo501q3iJkLmvCFIkJJtz8EwK5GWVrA+FytJSw7nVql14f1i+qM8g7tV2Q9Pf/WrtdY6z
	CP/rsq73I8Y7dlzUn/Ig+QkianDv1oDCti7U=
X-Received: by 2002:a05:620a:c55:b0:914:afc1:c66d with SMTP id af79cd13be357-9373945a4dfmr2575003185a.11.1787587237618;
        Mon, 24 Aug 2026 09:00:37 -0700 (PDT)
X-Received: by 2002:a05:620a:c55:b0:914:afc1:c66d with SMTP id af79cd13be357-9373945a4dfmr2574985285a.11.1787587237031;
        Mon, 24 Aug 2026 09:00:37 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93749d9531fsm532494885a.24.2026.08.24.09.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 09:00:36 -0700 (PDT)
Date: Mon, 24 Aug 2026 12:00:34 -0400
From: Brian Masney <bmasney@redhat.com>
To: hanzhijian <hanzhijian1991@gmail.com>
Cc: Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] clk: mstar: msc313-mpll: fix off-by-one in clock
 array allocation
Message-ID: <aoxqosHN8sqiR_XC@redhat.com>
References: <67ec3261-9f3d-4dcc-b916-19dc8be56a6e@web.de>
 <20260824142800.3497263-1-hanzhijian1991@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824142800.3497263-1-hanzhijian1991@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Mon, Aug 24, 2026 at 10:28:00PM +0800, hanzhijian wrote:
> The hws array of mpll->clk_data is allocated with struct_size() using
> ARRAY_SIZE(output_dividers) as the element count, giving it 7 elements.
> But the probe function stores the MPLL clock at hws[0] and one
> fixed-factor clock for each output divider at hws[i + 1] for i in
> [0, ARRAY_SIZE(output_dividers)), writing 8 elements in total.  The
> final write to hws[7] is past the end of the allocation.
> 
> clk_data->num is also set to NUMOUTPUTS (8), so the clock framework
> reads hws[0..7], again accessing hws[7] out of bounds.
> 
> Use NUMOUTPUTS as the element count so the allocation matches the
> number of clocks actually stored and exposed.
> 
> Found by smatch:
>   drivers/clk/mstar/clk-msc313-mpll.c:134 msc313_mpll_probe()
>   error: buffer overflow 'mpll->clk_data->hws' 7 <= 7
> 
> Fixes: bef7a78da716 ("clk: mstar: MStar/SigmaStar MPLL driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

