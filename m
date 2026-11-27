Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791700;
	b=pDzNYwWK7+DCNA9O5ffNdHyS82PJ191x/35ooATsXcIa96CTZY0wdeS62b1V9I0Lplnt
	 2nhgcA2oRaitna0qZMzorfLQ5dzWEanPHbnSECEkCOfXt1l42pBfPwimOOSEaHuPtih5N
	 5m4fvVGz0EdPz7jJ7VFmzdj5z6u4DNlP30UwvSlyf9yG/JxuCuOqGtF4tA7gbRg+ZpO5T
	 m+HglKgFZw3i7EQqVrVoHY6WABhnZFjTtICaQVZJI9UnastU1IFJwC3XbCV8iuPd8kUDm
	 ekihaXmR4Sd3qQ6FgLxFXlAuADuWRETb0Fv+1V3RyiKDO6aOeBCXUtYnQapGIUWw/4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=kaEv7R/BjRnXVDpwqhtcR9qe+ZhZ8m8cezZ42dYSI4c=;
	b=Oe5p3TLqDRh6lq5FqX+qYjEH5LfsHdkU6Y5ndtOoycSyg7K9bWGWWvL1Sx0NuM7Qj+4J
	 0JYe4HJ/myMAUqIpZJ+SwppC6Qio668n/P+PR3SxmGUjQ5twam+D4DOjXXShSbrTaN98t
	 zmJk4SGI8byY/lUSWQQFXugoWa9TyacHt4beNAyaE4ahfCNgGWfh7Xhowgur5NVfFX9su
	 A/UguA1fApL1YpJ7KYT8gND0RFhyri5qRI2dAdmWlEE5zfB2fJ6a8aOG6BHwvb73TYIaJ
	 JiR0IPQFXbpRMKM37ljB5Yf5WZ9Ts0n2zBPx9MyevWptdYH8N6aLs2WBKpbn8MxPkPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nFyZBs0C;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF57606A31C
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 15:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFF57606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nFyZBs0C
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so64345165e9.2
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 07:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795791698; x=1796396498; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kaEv7R/BjRnXVDpwqhtcR9qe+ZhZ8m8cezZ42dYSI4c=;
        b=nFyZBs0C7J3e4bI0vXvPauJ6r64YNndWq6eLYyzDQCzJVbptP2o0aZ90EisCekw/EL
         j2Dd1RtiL4zfIl+dtEjTVhoTHomp79HlXKDPaomyaugkReD8FKpA/yREODW1Ko/dwnvk
         XH2EPgNpBiyo33q8fEFr6zen0MR6CBcFDz8fnOXmyjomOEzGXCgqyZea9BLuWJ0LK0cx
         keoyBsZTrOeNv3lMG3QVH5wRj/uTIE2DbWVdoHK0+14NO4FMzs/QMOuGmT+UrCgZZGeJ
         roky9jZ3b7avcJANbXD/D4AbGqWrXvn5L4LpN+kzqKjFcQ0XcRHMMl7EMFxCNyipOJnm
         MVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795791698; x=1796396498;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kaEv7R/BjRnXVDpwqhtcR9qe+ZhZ8m8cezZ42dYSI4c=;
        b=p9SuTInaJ4S85ovXLIJrdcf88aA1yn9WzM34nf4s1fwJXnQiWXYQJrxq1yOm/O1i5j
         zihRJg+TLVlZCO1yYJoLxQjDX1uUd+pbyjG21gAuk7tx7dpBlKG9kCaxu/EIw/YLdXRo
         HnD7dGsPN5r+TWrQZ4OyUJ2EQIsYzpHMvQOJX97kXS4kD6iIMHmd1Q3fuVvks7e4x0dE
         XvtUGH0+HVyeZwUNAXLjlhHRWmJVH55f32FKSSC0q/Y8/svmR/9zdH3Aydl5cMTCmXs2
         0HYMhb/CYsG4m36+O5VZY37sbhODNg9l9qIt/4rMKGbBW+JIQ7E/bjctr3hUOUeyEVRF
         rcuw==
X-Forwarded-Encrypted: i=1; AL+hErErjKQEEH9SBtr6hozK4EJ+7ZN7m9q5qlRF80hFc4A7VBa64qpspXBWVWJs7Bla3qw2hlDndC2Rygc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ivG5k3gYtie94bDcAXnzfDXDbskp68e9t+VfthKVoRA8gi05Q
	7VFdGXEp4tvBLWcVSCW8AjZKGFF+e2EPkziL4x0TMc6AUEa+utGk07wvgctfboo5k7k=
X-Gm-Gg: AZFdTZcjEOJXC7TbBMhHegNw2LUv/GA/MXNvJCJ20AM/soT7zeugv2SIsaDCyzpP9FY
	F5JwbJJBnode81Y/nyD2c5MA1Ox442VosIG4QE+DNQbuAA2LHPXrOm2pfGx93ots2MXp1SvD2j0
	PRE35HhmGIcgdCH35K1mSF7AwkD2BOBrxAGBriRhVEn2XtDhq6gfuSUiyw5kQnWPAOksSNfOnd9
	KfxgOvTQKvFbXPQ5TvPkCNvlzkYa9y+x/6IvraOXxTpsEckqcC94BxcVnMX3kLZvJVmWoxSPKjs
	TzMe+hoiEjlVymL1gDKwy7apNTomQbHLzigRer05oqsyzTPXrFkTGnqrQQtrHgHZ3xuYkBQFTDA
	Po9wT+zm8E4YZZXaMtnfzc+0f/9N3fhOuBSTcPvsekpkdoQC/LDJ88pb+9e//jUdOOpHBcgLaed
	tO/ZvvcS9EjwQ6pHLOxsis9+Deiih8qw0NwK+h32Oqm0kNtTJEZ8djeyVNr2N2zkQb+nuCw+a2Q
	o0SanbxqlZai813a5Jyi4lXSOvgRORxQuKxYsiRrfVf6gi3X6ljdQi8QO/l6AJO8MmfR+iQqcCa
	0MD2Eaccirv91v9FsEZYNawSAn1MxeOWt5TVACtSRXTSCHTv
X-Received: by 2002:a05:600c:a086:b0:4af:c210:5b3f with SMTP id 5b1f17b1804b1-4bb88817ef1mr520259335e9.24.1795791696489;
        Fri, 27 Nov 2026 07:01:36 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm665457205e9.2.2026.11.27.07.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:01:35 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/2] clk: sophgo: sg2042: Keep gates used by
 firmware enabled
From: Jerome Brunet <jbrunet@baylibre.com>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Yao Zi <me@ziyao.cc>, 
 Chen Wang <unicorn_wang@outlook.com>, Han Gao <rabenda.cn@gmail.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261122-b4-sg2042-efi-rtc-v2-0-6d087e03e4e8@iscas.ac.cn>
References: <20261122-b4-sg2042-efi-rtc-v2-0-6d087e03e4e8@iscas.ac.cn>
Date: Fri, 27 Nov 2026 16:01:32 +0100
Message-Id: <179579169278.2788166.8963233310700352675.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1947; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=zyZPxaWhtK89KOfIzTta5tnUxxcbXy33/Xi1h4W0PlQ=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcs/3yNEp8maMy1+r+Wm/Ebptp0Biw5cH025W9i/gED
 OfYsO/pKGVhEONikBVTZKnhrhZ/J6n1ZdZ0ndswc1iZQIYwcHEKwETc4xgZHr8rKXnybqH076p3
 yxfsn5W+Vc/ixMfzHLltP1bMNnr63J7hn1LOTN7jjgU/O6XVHl+sVq8PNEq9+8Pfmct9ZveT2ru
 dTAA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> On Milk-V Pioneer, firmware uses I2C0 for the EFI RTC and the serial
> flash for its own image and EFI variables. Both sit behind clock gates
> shared with devices Linux drives, so runtime PM on the Linux side can
> turn them off under the firmware, and GetTime() returns EFI_NOT_READY.
> 
> Let firmware list such gates in protected-clocks on the clkgen node,
> and keep them enabled.
> 
> qcom, the only current user of protected-clocks, does not register such
> clocks at all. That would break the I2C controllers Linux uses, as the
> DesignWare driver needs the clock rate, so here they stay registered and
> are only kept on. I'm not sure this fits the intended use; suggestions
> welcome.
> 
> Tested on Milk-V Pioneer.
> 
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
> Changes in v2:
> - Drop the EFI MMIO patch, Ard is taking it through the EFI tree
> - Use protected-clocks instead of scanning reserved nodes under /soc
>   (Krzysztof)

Hey Krzysztof,

Using protected-clocks in the way proposed in this series would give it a different
behavior/meaning compared to what introduced it in Qcom:

- Qualcomm skips registering listed clocks. A consumer requesting a listed ID gets NULL.
- SG2042 still registers listed gates and marks them CLK_IS_CRITICAL.
  A consumer gets a valid clock handle, can read its rate, but releasing its enable
  reference won’t turn off the hardware gate.

Having different meaning for the same property is not ideal, is it ?
Eventually that might be something we could fold into the framework, but that can only
happen if the meaning is consistent.

IMO what they are trying to do here might be more appropriate, but Qcom was there first.
OTOH, actually registering the clock in Qcom would not be a breaking change DT wise, the driver
would start returning a handle where it would previously have returned NULL.

What is your view on this ?

-- 
Jerome

