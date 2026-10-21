Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792588892;
	b=H20Uud8BmH0kyEqB5O3wX3mOXWhBPTkBMzgR7HjYRuEjQVd77juZq947VZSQilgnqv/N
	 RcIAa/6LXgixKvs0Ceaf1tzn44uEYoc8ZCDQyETHPytv6WjqPrsGRrvWXk+uNttnEjFP7
	 JZV5XhrESc5c8v3QG705umcZbKvQEsd5XbWLLc/PgySJSYgd42Hl4mQxwa0HE7CkrX7ZI
	 06AVrVadgTzm38MbSP+4tKwBNaITc2GJeTVhh69sWMQvH2NzTHJ5+9Ic8fzdrLA4Nnd57
	 Ub4FO749o63TACFce9oxtk6V+GrCAA+4s9mvwG48ndSkzuFaMCWlQjFmddJ93HIweMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792588892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=30kfx+f5OMbhpYMMm98MeKilykOWKFy2lcIJ5DpS4GQ=;
	b=kY4qipZ6ZeygiXNSgyDLVXcCW6o4NUSUBSPs0W0J8OHpGKI/o3Cy4rXgvckUpHYEIgqH
	 LVh3BSqWHaKIYf8xP5VN3uMg1UU+bR3WDe6jJ8yIlQj6x7AM9ThIOnm/HkyR4HZHHWnCu
	 rdP6WQpQtAzx/F2uPOvdSR+n6WsL3a5yutxAkFNiL1P8Bghg6ABZkgisiQw1o2Qos5FnU
	 Yic8aPll7Qio+EeiodQzc16z1Z0HxlvnmVU/ZTNlfCDeTvkMi734LnvcpkpQqoBHWTIPD
	 7zQpfZqfs3cGK0UW1kyemZIBUSZtxcU0Uc+CoseWome74nOSX3Uce5GRVHTCYhvgKwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=k5ciNEZs;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804B8606A320
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 13:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 804B8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=k5ciNEZs
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so8497915e9.0
        for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 06:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792588890; x=1793193690; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=30kfx+f5OMbhpYMMm98MeKilykOWKFy2lcIJ5DpS4GQ=;
        b=k5ciNEZsaiNxruR+YrSCyEPMx2qRt9HQXeO7PNXhzBssF85TH8ZetQ64YGvjMTENTS
         1Q9zOQYT1GFjpslrzIasuWqfcwgITWXIq7da+67tTgZevL8crYb6/YuuFXNi0wlmVTOt
         XwwWbHjdih/afI3BDCdxlZ9eQBQSyctMyG2A0enrUAEUpNIsKE5om8PlqpQegEKFS2xP
         ZvkPAnZskjDouUPsifX6mC4muBaFbnw4u9Stx0hZEFNtO0kZ7qh7/X1WxNPDBcNhSxHT
         rFOrZXLF7VqqU3Wew8mkuEAFOJk+xlSHDwaTt3CF8DPj0/x1EHw6wRNuPJWj+cYSh8+/
         oFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792588890; x=1793193690;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=30kfx+f5OMbhpYMMm98MeKilykOWKFy2lcIJ5DpS4GQ=;
        b=BC/DipFJDFtwEWpti7L5fGmTy49pkrZZwNYvfpe+bMFnwsT38cyuEad57oJIExQlad
         i3H8DEUQzOdJEZvDpTXKwMGUIkH5175t3BZxrhBwOffbLBBE5SsgyOAuASHFM1kQ79wg
         Ej79i3Br95dfcVEqInG/O8W0hflkm9u8cyoWeVpS+VkxBw92PU9gD4ak6O3GK/owHW3Q
         iVsFS8db0/NygAFJhIT16X3mo8EyF8co2VCBYjRweQa/Ws6B7proFAZRt9Vc9dbPYeGF
         oldBaeSa4bBkIQn6+hn6h+r2WzE77mZ3GUyXjWSbgZdZmTv+sruMWPug7Q6q1WgAtpg+
         Ab2A==
X-Gm-Message-State: AFq9FYLLiuunET8hnLi5Z9xtWA04sowiAo+XmcVBOO8St/IYt6UX/2Fv
	u4H3/KIvQDeUCrh+QjdXPf39zq6WlN0K8v/1nngKieHPs8KmEhNoe/WNKihfURLUu9w2MUT1ypx
	XWNSVtJ8=
X-Gm-Gg: AYBFou1TRPEm1cBaKcheW+hMfHnzpq9lwwKMxsKNMx7dapkPDZsHjMwHWJTDv7ITAEN
	MpJXBot6V2CToTUDT00LobOJp+I57pzMkmhAyhIcXyQRRWkePZgRnNGBJZ826lgflU83bqlQ9+Y
	ujOEdMjlgx+kN7MfhiFQ5j2kmdDArWWfjiYvi+RZMe32WLcZiToegvpPuwGSdSCfauN0r0oIN8g
	o4sogu4L3N5Rh567w4uqyB2mqhonjfIGCOSwYjC/w2xx1oRjVIJyBGTBv7kgxVPTSPoTJsgAVeB
	8f+A2HN04HRfKyleTPChCdHHB9k5T6s2AuVp68VQIMug8ncWwi9MT8X50RKu8Dlp/eYsY9/Fxsl
	unWATkmZWGoqScH8fcy2noVtpO4p0cFGLw+bH4Sv+dy5ZxjDzR32sU96EOIMbrvKhknFvDnb6x1
	WiQocpvVhl7DL2lzbMNsqL4DK5fkaLXyT/QUoGcMH/GgrHtKgkmxsRSGV9brhxb5MQ9KYo2B9j9
	CXv9/gnUFXnBy+W6ra8eewMEsmFUaSaZYwnj3i9p1CMKgeiT0cYta8Ll3E9NKJbQ/NQs7Dne+Y=
X-Received: by 2002:a05:600c:6097:b0:4a1:d456:ddc8 with SMTP id 5b1f17b1804b1-4a1fdaef8b0mr39864365e9.7.1792588888044;
        Wed, 21 Oct 2026 06:21:28 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f8016c93sm112679735e9.5.2026.10.21.06.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:21:25 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ryan Brue <ryanbrue.dev@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] clk: mediatek: mt6795: fix the FHCTL DDS mask width
In-Reply-To: <e8389c1c-e858-4171-adff-5bd94909120c@gmail.com>
References: <20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com>
 <20260912-mt8173-fix-dds-mask-width-v1-2-3d0c0292c85c@gmail.com>
 <88272aca-2a9e-4a75-b7f2-4f7aac8b6d18@collabora.com>
 <1j33ux8of7.fsf@starbuckisacylon.baylibre.com>
 <12e0953c-5181-45f2-b409-05163ab2a031@collabora.com>
 <e8389c1c-e858-4171-adff-5bd94909120c@gmail.com>
Date: Wed, 21 Oct 2026 15:21:24 +0200
Message-ID: <1jy0brgpez.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On sam. 17 oct. 2026 at 18:03, Ryan Brue <ryanbrue.dev@gmail.com> wrote:

> On 9/28/26 7:22 AM, AngeloGioacchino Del Regno wrote:
>>
>> Please collect the changes that I've reviewed for this cycle... I'll 
>> start
>> sending PRs from the next one.
>>
>> Thanks!
>>
>> Cheers,
>> Angelo
>
> Hi Brian, Jerome, and Stephen,
>
> Gentle ping, in case these slipped through the collection Angelo asked 
> for above: this two-patch series (FHCTL DDS mask width, mt8173 and 
> mt6795) and the related mt8173-mfgtop fix [1], both reviewed by Angelo 
> on 14 Sep. Neither is in clk-next yet, and both still apply cleanly to 
> it. If it's too late for this cycle, just let me know, and I'll ask 
> Angelo to take them in his PR for the next one.

Hi Ryan,

If you do not see it in the clk-next now, it means we missed it and it
too late for this cycle, sorry.

>
> [1] 
> https://lore.kernel.org/all/20260913-mfgtop-no-clk-api-power-on-v2-1-b84771a3d5bd@gmail.com/
>
>
> Best regards,
> Ryan Brue

-- 
Jerome
