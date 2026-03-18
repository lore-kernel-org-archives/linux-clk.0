Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29A0331218
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 17:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773853568; cv=none; b=qyU6pAhTEGuw9wO2bl6xG/k9il6kHPQmdN9EawrnoE0A175EufLUQ/SkdSD3f1exBO8KZSndZ5HrPChlet/3Bpjw64RGlSf8UDCJHTfVUFo588SQDFb+b83XsCbzPig0YrsIojizMyMLwoeAB7gEFwJHtPQFStu8X1BZiOJWA6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773853568; c=relaxed/simple;
	bh=/aXcXwHYVIx08CpLNNgdY9gTrGn3SvSSy/SIGzOPCrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQ3zFSoqN9F7kBem6kpvjjdBfQYF9v29Hcbol4m0JnVZFZ2hufago0pXlf25spju8bbmsCcK7Xv2kF9M6zEZG2pXagWbe27zRZRehJv+hxGnr7DoMju4Zpbf5aWT576jHEQoLC1wBUKV8OURzPEodYPL4kaOlgxTiEMzUnTc5ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZTOoPRw0; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SUEhWyop; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZTOoPRw0";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SUEhWyop"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773853564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6hq+sfehTUwcDaYBmOxEPMrx/kSMTzZMUDBJYS3i4YM=;
	b=ZTOoPRw0JQjPdaFXHI4xRAOltAScpyXV88c7179awJSoj2qEDzhN/i6tyry2kEAUeI9dke
	9blT8qXtj2+xZu2zZjRwR9Td6QL7uaklP8EpDZn1KPSvE2ty5T4XR//I52z1FCXsi64N7z
	oEjdmYGu4JqnLsC/wnKEXYTZa6POk4E=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-t6feygZ9O9atzEAo7nWa1Q-1; Wed, 18 Mar 2026 13:06:02 -0400
X-MC-Unique: t6feygZ9O9atzEAo7nWa1Q-1
X-Mimecast-MFC-AGG-ID: t6feygZ9O9atzEAo7nWa1Q_1773853562
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd849cd562so85262185a.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 10:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773853562; x=1774458362; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6hq+sfehTUwcDaYBmOxEPMrx/kSMTzZMUDBJYS3i4YM=;
        b=SUEhWyopf6EBoPLLeoihJ+YoAOxPQ81aoxeU5+ydX+umbxGuD0PsMUPRAf6NnMqloh
         kstXkbMqzOFLcmuVCQkMaTbnYfmxvGs+n8Ud8JC5eIudBq7uRETT/dRkbfNiP6XHGrK2
         xGLm+6+NdHpH92s20wiJzhO3g98DFGt98LjN64aoaYKQR8Gu4XCtAXsfvA008cjM+LRA
         9foepCthRopflQFZc1tPWZdswZxPPKUmb1eVZx7RebfR4xuhUHYUU4LznBtgPqqmaHNa
         sfjJk++aacEeKQ29l7K0SBgBEG4CGFG4nb8rrg1bMUuF6FaCp98KNcr+BoFke8tU0aGA
         T6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773853562; x=1774458362;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6hq+sfehTUwcDaYBmOxEPMrx/kSMTzZMUDBJYS3i4YM=;
        b=MZy8YYAMBbWrSjewZPDe3ePHafp9dxHZ29MyvVh9B4tcToo1BsG0fxB5YGQaWzf6Vy
         vQ3SN3OH9mYYOWR38Jk0SqvusNievMDtIMnI1bfEVeKKd1bbmBXJT8PIs7E38iFMIeqz
         1/4tFpf1dPORKHpGX4feQLGIjbYfxocxQnFIB4F/SCbHea0eLOSWZyrrhdG2JywNDz3P
         OI2+VgQ5WfcMlqurY782j4ZZglsVKGqTNAi+j06pjXqdGGWToKPdbJ0UNUFg+dui3SSC
         A2Mqo3xxpBSWmCvGAouKEgfsn+kZic7+Di0RPXZwW18CGKkLL25pIRr2RehJ54W1pQoC
         OKyg==
X-Forwarded-Encrypted: i=1; AJvYcCVhhp/S+Uyz5pntO2eFeIkR9p/m36XsiyjhlRcfwIoaHUvRzyYUVaFf3aT6NEKquLgcsajG/VXPBzQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcOd7F3ypeYaDFBKVLjSP/vVEl73TCFQ4hfE+ptHd3qJ7hmEh1
	Zk/wPBLQ/hEe7QaKV71nJlf97xdZsnHy23VQ3ysiHIKJ/7qxhxapMucJVpQn+gRdJqknW8O2tI/
	tUUCogqXFiSBEJhfj/c2AgtI03lkFZGPWGjNtqcu4hDp787z6/kZOq1Gf8WGO6w==
X-Gm-Gg: ATEYQzwRGTYbJmfwv7ERubYdVq10jcHEdNZr7E0WzibWaVg8pem+/Ii5cH2HO+ZNLpZ
	CipBACrRRjNnfa2X6/kly8ooagudN/LZZ1HrWDFgiML3ER1zFADzwNqzpMUAIwCEX0wXkaN2Gem
	pFNiz5Ug5IM78Bk6ack72YKLIrMcUxILHl+W2BDHDgc/y+lezOcHRUg9rclZPCdeXy3XEAo1Qoc
	vijrVLFLYCtbTQYdE9YbOcCSeN2qMGdWkiShd4fQ2uhGu8AM3pP1DU1AXLJ1sozcw8ha13xJ3Ep
	cMyaQVqS4KxL41M698Cu4cx0rj1eGblJZbRqqVh36Hv5I1O99N5fm9yjSMBkl/u5BMfLc10FtOt
	2HffijAKuaH07SAM=
X-Received: by 2002:a05:620a:c4e:b0:8cd:b5f2:3b4e with SMTP id af79cd13be357-8cfad319e43mr605999385a.44.1773853562062;
        Wed, 18 Mar 2026 10:06:02 -0700 (PDT)
X-Received: by 2002:a05:620a:c4e:b0:8cd:b5f2:3b4e with SMTP id af79cd13be357-8cfad319e43mr605991385a.44.1773853561446;
        Wed, 18 Mar 2026 10:06:01 -0700 (PDT)
Received: from redhat.com ([23.25.77.22])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfad167ee1sm261115785a.28.2026.03.18.10.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 10:06:00 -0700 (PDT)
Date: Wed, 18 Mar 2026 13:05:59 -0400
From: Brian Masney <bmasney@redhat.com>
To: Anas Iqbal <mohd.abd.6602@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org,
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
	yamada.masahiro@socionext.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: uniphier: mux: fix signedness bug in get_parent
Message-ID: <abrbdx8jsVaG9LVG@redhat.com>
References: <20260318110251.2412-1-mohd.abd.6602@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318110251.2412-1-mohd.abd.6602@gmail.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

On Wed, Mar 18, 2026 at 11:02:51AM +0000, Anas Iqbal wrote:
> The uniphier_clk_mux_get_parent() function returns a u8, but
> propagates negative error codes such as -EINVAL and regmap_read()
> failures. These values are implicitly converted to large unsigned
> integers, resulting in invalid parent indices.
> 
> The clk_ops.get_parent() callback is expected to return a valid
> parent index and does not support error codes. Fix this by returning
> 0 as a safe fallback in error cases.
> 
> Fixes: 734d82f4a678 ("clk: uniphier: add core support code for UniPhier clock driver")
> Signed-off-by: Anas Iqbal <mohd.abd.6602@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

