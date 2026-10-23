Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751719;
	b=qLyeIJ0cIRlN4JgdJHS4oHwY68QsBoyR5WBxkqZ8VGS4TvLneX5g2HFjwhObryh059DN
	 RpQQZtwYrp5c07AdhcWtFgce0Q2HMlcgHBvNSt/HNxf3IzjfLkyr2uSA3WgK9bE4CLRrR
	 jEzFtycWaqjuIRaQr3G+FqB8UelPUr95VxHZ+SLIpc9iEUQU6O2kM8gCJLwIHYSN6NPwT
	 ZylgqHA5sF1BqKM7aVXySdvT11bpuHlbtQvVPC9PgBBUkxUuvvf9poXAD+qaHpZV2TVQE
	 Jsk0lAXImcGCEzLMX+qvp3xiRc21KLIHn6T+wve1+V7XrtTmxeXPDEtOdEUg1g0e0bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=OAwUO3xw9jddafsCMcqvt+DK/SLIQKUYqgCB0JnxYDw=;
	b=xyVb4ebQshdFWZYx+7/MnZqFkYJg/mipr82yPsC0DOM8/9UDtbLAByvikYbO5eZWIVJ2
	 Ii1D2rz6kJT/SxJwNzQqlF0EWI8IRjcSL4pfAqRPI4KJVc7BajEsl+uLujQ3zk/zy+v1b
	 gNMFkfAlN6KpxNpUpGfyocNZwAnaqxjON0o4RITuKNgPkZfi5I9Z7FA8osDr9CHh7eTsa
	 gVK8BRVT5i+Sr1S4xDrJTLbRK8IDT8NEvbGwJHCAnsAhCY4NL07Rk9JX7DbYZvCBToZq2
	 Xd5nB81NBk9nI7w+Ao6jb7so1tiIYULbZ2GXoOB44LVChSiXi7XCEo9pGYWQLgxgnmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YvPzcphU;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0BE60A2615
	for <linux-clk@vger.kernel.org>; Fri, 23 Oct 2026 10:35:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E0BE60A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YvPzcphU
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48b042c0759so482096f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 23 Oct 2026 03:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792751712; x=1793356512; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OAwUO3xw9jddafsCMcqvt+DK/SLIQKUYqgCB0JnxYDw=;
        b=YvPzcphUeUm9ntiRTjXKfvXX0Bscbb5UYsaP12qKD0C8ZUDh/CjG5GhOd30VyS901B
         I7injMmS92W+KzSmo5Vnk04EdkGjUDDKA5Sx1u+znNMjnHEAmhw0cA9hDBYeNCPIBk/3
         lalZ5NSjW2bDjo8ape9ruRipgTlQQFHtMidGrqzr++5bd8PeNjVTLlUyrNwpy0sO1wPb
         PHPBODmv+H43y/gEzChKYND4BmwfNpF11Y210c3H9oTaqc+W1+1wbP2A1W6iggjqkLf4
         mQ+5PXQ/1OTr8o/M5/RM/JwJbaLtIPPEBRbilXubhnYK09dJX8xEpS1zm3r72ZNl7Yuw
         G4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792751712; x=1793356512;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OAwUO3xw9jddafsCMcqvt+DK/SLIQKUYqgCB0JnxYDw=;
        b=wWuoJ2kyz1lzU56tOjGC7KwmRn/AWhx27NkhE7mb0c+VYpChbK9kJjrtm9pUTCZZDG
         mS1bKEyIUtQebcyioQLm6sVZJbQlZUTTyNDIPwiiPDpmIfzihe3N4vUjE6pwUxzr7rOE
         eLPA+SmFfDVko6h1OkaHOo8WEyI4j00oROUE85S9O4WrHEQY+wsL9Zv/HuhmJWpOO+3j
         QcU9GPCXl6LqrPpY9rW+knUFoH8ml2D4vYgm45eTwaB2vqm2ZqOQhjrTCtj6o0MzNo60
         9V2TEEX56P9PGiMHkhcHrql9CWXEQvisl47g92n60PcJLsImP0ReiQ4+pRmNnjqv1xl8
         i79A==
X-Forwarded-Encrypted: i=1; AKwUvByp7aAXwPY2SoLhNZv08BZ0iFWK/DbAxoxj1bQpd4YGfalZaJJgQFR1KwMobkT0i8tQRWNScV5lIC0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoA59WiJ0lSgbQrMjVC9uWUwXKm7bmLsk3eek8DCDaYFV+BARA
	gYMAwDhOkn/kjPTvHCdTSz324YbI04r1BfsUX/6JEdhhwNGtRFo9Dcdw+mgl8+pS5wU=
X-Gm-Gg: AYBFou1V+nNIP5arttDlW+rShJnTNAKv6vcQjoaxdnxkKmFuZAY9cHtOfbcSPajoAI8
	g5sPDWjwId9F+EHHj1490hHSHENC8dg4EPYB4XsWTj+rW/P9V3wP0LXEtM+8M9hPBKm0ZbghmZR
	gbad8NcsiI2fU1sKMvFTRSiZ89ar8nY/CnGU9s+wZDWjryCMorQ++Xw9gBmsVoLFEYUPz5rnRCq
	dNQt39ohxNhnFn+OrmXIHeVCrHtQe2l99gvpm+xl4/GyZBGPl7VBdCHOr3XTmJAU7kSYE4dNoZb
	lpcZOtNrWGvC+xkOoJqvRp1r5pb+M1rNpnbLuUfJuhZlkWTn2KmKB+catEull2bjydzaicy/kMV
	wLep+A/3fq4LEXgN/Ewhx/+rujKHETX9AcrWGOOXwVJ+pkljgX8RvCz6HQ8PCXlzl97Exkeavh2
	3xjfpPrBKvdzECOVhq6bniTKHXf8Fdl40cvYEQpjjSpl3ZM5G7U1OuWnxzyku/tktjoNYEQL7zz
	rNzz2Vn2ev4IiNomxr0BRwF8PiaeDFQ7auBINCQpBL6x7fn9yzuffsp5MVG1O3KJtL1+TyAoK8=
X-Received: by 2002:a05:6000:4916:b0:487:a15:b4cc with SMTP id ffacd0b85a97d-48e38595e5bmr2679426f8f.23.1792751711919;
        Fri, 23 Oct 2026 03:35:11 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e37edfb3fsm4713525f8f.8.2026.10.23.03.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:35:11 -0700 (PDT)
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
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH RFC 02/16] clk: Acquire resources for clock transitions
From: Jerome Brunet <jbrunet@baylibre.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Viresh Kumar <vireshk@kernel.org>, 
 Nishanth Menon <nm@ti.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Mike Tipton <mike.tipton@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-2-3041b788e9f7@oss.qualcomm.com>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-2-3041b788e9f7@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:35:03 +0200
Message-Id: <179275170360.4070168.11650113664838519061.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2342; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=dNgQAFqyGnVxmM7oecHvQ23reWhdI9mPMjanH5L2B3M=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFm3LaJkUwN+3WXTmhS0Wn1LV8+H60VT70se+bvq/c/mj
 X9XzNSO6yhlYRDjYpAVU2Sp4a4Wfyep9WXWdJ3bMHNYmUCGMHBxCsBE8tYxMpwu5GVlv+ARel/H
 l4mrmS0wQetMf0lT0c80eYtlV0OENRgZLlT8mjPF1ViKdcu9H62FN3cvnnFj228+iQvsp3ccXsR
 nxw8A
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Preparing a clock protects its current requirements, not the resources
> needed while changing its rate or parent. A transition can temporarily
> use both parents or access an unprepared clock, and a parent rate change
> can cause other clocks to be programmed too. Raising resources one clock
> at a time leaves those operations exposed to insufficient power.
> 
> Failures make this worse: hardware may already have changed when the
> operation returns an error. A matching cached rate is then not proof
> that resource reconciliation finished. Retaining a temporary enable
> reference without a corresponding prepare reference also breaks a
> consumer's normal disable/unprepare sequence after a failed reparent.
> 
> Make CCF acquire the affected tree's and parent paths' resources before
> notifiers or programming, and reconcile them only when the walk stops.
> Keep fault recovery independent of rate shortcuts and subsequent
> consumer reference-count changes. Require explicit recovery of an
> ancestor's uncertain parent selection rather than reporting success
> from a descendant request.

I don't think all this is necessary to address the problem described
here and in the cover letter.

IMO a new provider API is the wrong layer. The framework already has
the hook a provider needs: the rate change notifiers. What the core
should do instead is fix those notifiers, which do have a few issues.
You are fixing one in patch 1. Another fix, about setting the parent,
was sent recently:

https://patchwork.kernel.org/project/linux-clk/patch/20261021-submit-clk-parent-abort-v1-v1-1-2936181822fc@gmail.com/

You want to act on some changes before anything is programmed. PRE
notifiers are the right tool for this. The user of this change in
patch 7 could use them AFAICT: PRE sets a temporary vote, POST settles
it, ABORT drops it.

Also, what is acquired here follows the requested clock. When an
ancestor switches parent, the chain of its new parent is not acquired,
although it feeds the whole subtree after the switch.

With notifiers, the parent fault state is not needed either. As it is,
it blocks every request on or below the clock until the same switch is
retried.

Could you tell me what you need from this approach that cannot be done
with (fixed) notifiers?

-- 
Jerome

