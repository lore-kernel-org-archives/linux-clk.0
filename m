Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792578032;
	b=OmyRUliLDS2KEivJKWH2E90v9emX0G8j70S8IvTZvpTgyc1i1O8rL4LgRXo6haAEtt4o
	 SWxN8REuURpRM8ZRbT2BgItnsmgFGEoVt9aSOww2zRdBIS7LxthA1eFINiKgAxcBQdBD0
	 rfaGGH7O33GQrUqqz4iiL9XAFsQvgo++1w6liGikjqd2fzvcz988YQCxxh3uHs0/VaGe4
	 ZyQXCsrFZoD+n4is38ddWr7bU/f6xc0Go5oMaBFPX7UHb4/kL2SuDJmrGwckOQR/E4QQi
	 zGFkmZmFVZimtE5r3kCWlZiuxlL78iAkaQhq9x82ZxrfVUdUZQ7l1lRLyQs2C8pOoSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=0O8KxR/u4jNMtz6RpoxRSfPGCbbGOO4Hji6U7RyM5SY=;
	b=xi+2fSwZQWkXug1FvTZXIb7ffsOz2PweNkWbneXAq7vVnFmlOZVUacZ8DtEE19viH9kv
	 4vDcQ49HNlytZA/HgcGn/5Yt26itgjKNJWCaeVbt6w12RgpjGojUXoVECGnBa06UEiISF
	 813X8YT+qijx3A3sfCjVPEbOZYYabVZ5JqmO7T32zefUfFe1gFCzmMEzRYAYZ5yj2MFHn
	 xLHEANjSOU3vK1n+GnP/jJSYhoC8DAv6/xWcM5cnfntosVVb7S376bZN0uGV/SKDg9O1f
	 dVVb+q38z2btd0KwJd1pCXTfm1U/ACRu0zrdlwtovh8o5TBj98MjNMmBHMPY1Z44lFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Pbn+akcx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397E1606A31B
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 10:20:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 397E1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Pbn+akcx
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6acb9c018ffso872354a12.1
        for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 03:20:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792578030; cv=none;
        d=google.com; s=arc-20260327;
        b=W4XI94V8EhZmRmflS8UxVsCRCToYrtdDueQ+9m/j4/biSOJ8GeH1bpbdCwAO9YNSS7
         5Zq2LSk6Lhv3yuK5Fe2yZfrfIMIrla5ezI8Lc87b0nXDKF4g3/U8V3iLAGjNDhXXW47U
         T90zVYH2lnp9ozY1Jb8fLgGXBPs6VYaBcW/vQTtYRd6VZXzMsCPFbA2NF7DhlA2meSYq
         2qjCIc4yyoSnPErvBpyroAbwb8L7e4Mx9oZVXWXwD8PWa2fM+NCsqX9n2irtCzMM+GfU
         vSojSy2YFlBFXtu5Q4gBmr0cwSgtpj91trbqgJZWIKSOeE/gukewwDZ0SfD0n6lEWYcU
         6f6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0O8KxR/u4jNMtz6RpoxRSfPGCbbGOO4Hji6U7RyM5SY=;
        fh=Yt91gWmNe0erPqQIVtmy5gINOkndqa3U36Cl6/EckiQ=;
        b=HOoZq+PdKLfLaZ9xRY6koKFn2wAYU6plVeRC3B6AsG4Dz4O0zD5cDk88154wlchoDW
         b4tJBS9+s5ktwkvAYnUTz5lnRIUKRIhU/z/Bhh66JoWkc68WoHnqtaC5EimlK4EdB5u0
         rWlvA4zz29YLs9cSQdoO8xakNK6k1k1TyaY2R70GMlIedy0WWrua/v9gmERvj4ggPPRe
         LW9t1YHOMaV4uFGSaSnqk63fLZqEmmqh+hzH/FraySY2nXcsbL/yM4FzcUjjjnuuOOfF
         osDlew42EgQInR7rvLhITrCIV4WnMqN8qDwJrdOA9k0NUNupwuEuoXoFdcg+CxsSxxTZ
         pB+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792578030; x=1793182830; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0O8KxR/u4jNMtz6RpoxRSfPGCbbGOO4Hji6U7RyM5SY=;
        b=Pbn+akcxlX1w/E1KDARRHcSQyL418wKFzrO93mqcy4+kMnnDgAXmhIhKPjmGu3APn3
         v5Ob6na9EMP4nzh+b0dofPFq+i46JRmPIvA6kuevLjmxSsIRL5DHxRromr7+C7q21ZWu
         NTVbudeC5ZGLF8HfqhWoE2JwZZG2/kIHL6pQdsv7C9Ex3sMQ49e5GQAzkICiB/6UVi66
         zRsVlzPjFbzMqmoORpLJJctXP89y1cNzkVyjjVLGuI4c8UkTjAoRbSLxnQvvBa4Lsnsz
         617alJ7E4HM7tGnIA+xHIEyvbtysnyw4/F/TI8K5KHTCUre1jNzViVE2BEAQN+l9l+fX
         q/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578030; x=1793182830;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0O8KxR/u4jNMtz6RpoxRSfPGCbbGOO4Hji6U7RyM5SY=;
        b=OFRBqylfaZTGUTfzSTc90xIXXHGlEW0pH/0gX+JVHRVadJgOG/tPOCWHU8P92nT3Gq
         8XvgOSfsE/QhQ+Xkvm0xtKrI+oMh6eZToMVW/QNO5BUc4Az8M8tIbTQIMP3+1GWm78xb
         QDnOfOYinJKxmGlgBkBwilg9YfVIxOlpkLg9iVLj/kFdUCG/3dVJCLKZ2HsQq0P2s0jS
         KU177Qhuej0o+p6+LDHVOa80I8/CYhT/0vUPt+vFyTvYGCXZ5CYmtDlRHWUn12AZuiBK
         GhNqLYSrBXh04X993fwfl/CAnZJJcQOSnEl9hUGWSAfU1CRqLDrGnDw7IR6gHuNO5hbQ
         S80w==
X-Forwarded-Encrypted: i=1; AKwUvBw3pYQhT61l3J4VtfoFgDUDrHFrNvCdJic7Bj95NYyQaXQL5n8Wm2kZ4r6USlT2DJyBfaeHaQet2/8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOpVMP67TnkuL1PNdvnUIaLmKkKsytEAdxd8J4X/sXXBuIRJaG
	rwAwEEAQe3xP88cIvGE0FWJ/bD+/38JobW67VauEyw5N+obUHiRzTteOEl7ql8TdGrujYjPwL2L
	rZbrBMb+OkTdHD07PqR8uVKHxokXdw4M=
X-Gm-Gg: AYBFou3J0ogiZwx3v4wa6glMic7u33YM806tMqP3GwJ9g8cwfkeuzSPtRD4vhYt4PIh
	DthYBdbABF1gSrCL/Dv0ytpVhodkXgHz59ETQSg9v3g15MGBbRfH2QCDiTiP18Jfp8bRBj+6KxM
	ECg/UrbAVGoJSNVbNTXQv/esfdEAdb78L6B81go773DpJs/iB2DHzPN4F4fX/rQmEvTbu7mxnaW
	IaEmy5MKlm09t4xN8cbBxmafsaI+ME2Jrb/NtWy0pUUrVkZ62hzOCrJD8eV2dYsQycgkpfu/oc0
	I0MjsX9x+Zg4PykW/PegTi20p01XsymPjN5Nw9SmRVVAQ9j5NZmse6RpvMiVjYmBkH7CNUsq9nA
	Eps5FfPBQuDx/GPrwSniNpMHn3XcxofcxMIhv
X-Received: by 2002:a05:6402:1ed6:b0:6b3:afe6:4fc1 with SMTP id
 4fb4d7f45d1cf-6b408dc32e0mr1130962a12.2.1792578030234; Wed, 21 Oct 2026
 03:20:30 -0700 (PDT)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260921102522.1640072-4-akkun11.open@gmail.com> <20261021094542.59417-1-l.scorcia@gmail.com>
In-Reply-To: <20261021094542.59417-1-l.scorcia@gmail.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 21 Oct 2026 12:20:18 +0200
X-Gm-Features: AclHuK_9WSUvbl7lxj9ijaAvYmNx-kmxqZkezsuL4zt-K3i_hWfIEDEOQ1AATPQ
Message-ID: <CAORyz2JODezexX2ZGwDk8LcBbFA+Jm0hRBAamJ7Nmk7Q+a4R1A@mail.gmail.com>
Subject: Re: [PATCH 3/6] clk: mediatek: Reserve missing MT8167 clock ID
To: akkun11.open@gmail.com
Cc: angelogioacchino.delregno@collabora.com, bhelgaas@google.com, 
	bmasney+clk@redhat.com, dakr@kernel.org, jbrunet+clk@baylibre.com, 
	laura.nao@collabora.com, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, 
	nicolas.frattaroli@collabora.com, o-takashi@sakamocchi.jp, sboyd@kernel.org, 
	sjoerd@collabora.com, u.kleine-koenig@baylibre.com, wenst@chromium.org
Content-Type: text/plain; charset="UTF-8"

I apologize, I just noticed that your patch adds the "_dummy" suffix
to the clock name. I had originally applied your change manually using
the DTS clock name "hdmtx_dig_cts", that's why I experienced that
error, but when using the name as you sent it it actually works fine;
the additional dummy clock does not interfere with the one provided by
the HDMI PHY.
I apologize for the confusion, but at least I can provide a tested tag :-)

Tested-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
