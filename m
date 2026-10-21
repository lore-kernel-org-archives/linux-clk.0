Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562458;
	b=Cda5dsPYjS7Fn0mNj3+vwNXHRNTkbSMwcqeB8KuZ7Dlqz7kKy96flaOKd6mQbZcnLrpg
	 lnvc10LLkBI6miyzvaytf5Gfu2JWb4TdGIONR4Y1KmwRm40/aGei+2MWRXU3W5CyGHnHc
	 st1tuY3UgCK8uM/z28PjQLbfUteooyBr1iQ1tjp3rihjWAIrJIelzhafWb0w/M3RK/kIU
	 N9hWZXaTRYdV/dF8G9UIuodQDJGF2j/KPCLWyKPDU7PyRFolBffozsVF6MRtGJokV/9y3
	 GWpmcAzIA5Cq4LBZ/+WBDMkeSqJzcRQy8+DgMYm4aYkhGKWMw0SRtw0nKXNVBFZCXlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=hZCxWGNKVDrgA8OGLPMyOoCY7CLwULXtFPHSf9AA35s=;
	b=v+uWx4L+VFFcZEb3zF+rYuWEO/3fiZVL/y0FJiUyFrQcWJWrxPglaAk1/BPKJHOycO6n
	 h1VeQoDlxpiC2FwwJzuSerX2csGe4ZGyV4cUFrw9NHBexgYV3MsrkpM0PnVMto3BetG+w
	 dkAYzWcMSpBohf805nlZ1xhZmgP5/fKWsHOZdeVm6YRCDsTdltV3dOppAsqDZ+yhPAuVu
	 nuKqKSQUSgUyFTO1ovpwRlvBscqblpNVUnFxpQaC9yeBN34S0rgI8ByXtgZfC5Rm7lGcJ
	 9p9T2Q3M7cROh/L8G48l22MsgCeToj3QIfHsKWncEfhF5dpXHdal6BxvJK9cycrpcaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Gqw1GNso;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCBD606A31A
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 06:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADCBD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Gqw1GNso
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48b042c0728so59583f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 23:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792562456; x=1793167256; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hZCxWGNKVDrgA8OGLPMyOoCY7CLwULXtFPHSf9AA35s=;
        b=Gqw1GNsoCG+9KpWkTPYZzo+UaJvUCPA1dNDXZ/0DkIGndas1vu2bJLzJJ2IGjdi1mb
         vE23Eq5mP+36c0R2qOUL2c56aDDhjSDSV8O/iOjqhzgrvjfhgjrg+punJr/auEddv8w0
         icaEOo5omAapcuEKLbeSGH4NKWfsB5vnjVwVHGsNRrDnFRPpKX5dNehplZKOlMh0Fk5I
         e8y2PJb2ao/d2LybEzsv/QXoajuhFYTD8466he41BvH4znFoeQvmIjV8Wo/ffYwq2G/O
         aXW/9MeUHo/CmPpWOq7YAg0VK4E+UNuM0EKJAq/k7JLKXmrGQaQNRNWqMadHK7UMyyat
         gQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562456; x=1793167256;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hZCxWGNKVDrgA8OGLPMyOoCY7CLwULXtFPHSf9AA35s=;
        b=W+TQZhjMPcxMOsxD5B8/2u3c/AcDNcw/I11jv46GgZ2XUaLHeDxrBENMW0f7cGpu/h
         qAbxueZh7kO6LlqV+RllFXLC6/Qt4V3R8lwBqEViCuNr/7oaiQQn6FI6uuIdGVYutEmk
         vmndK/py39JpEDsPplrr7Qs+LOPB5f9MQcTGYeJX31UMzzd6ye3mSPiaADagXqDhZu+Z
         IDy5NaR3EawjsRCOh+KVdLuqWm4iLnh2XKz4NDmfkM6eTQjV8lPzbgehT4uvoy9cHEy2
         810kOEZM8FhA6dER9Cl25lmnQ8u3vHArLqsuE6ghKKnvS7CGDN06D0IevGxeqtI/Dr9K
         fklQ==
X-Forwarded-Encrypted: i=1; AKwUvBwX5dwvkyXb44tsXw+hutAAqN1LoPyDPI0o2+DamyGg0kEBRNBOPEuYMDK5Xl1WdkVf0qFwhryWvHw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqMdbX0vhWs0K0NpUR+YDe/XTuAbRYOGu70cMavf/iPr5j4Q40
	AIidpbIym6EuhuUU7IGbJbxSN2r8o4f5yHo6Ww+jEIFZdLE1XxKJn52F
X-Gm-Gg: AYBFou0Bq3V/q2nUDKT724ykPzyJKuPrK96vMgKv44a+sksTfYob2b1OB+5oxh0woJ0
	x9NhcAhFo0C+rLldphslpEWomMxZlDLjhABxfsCXZ/h4c1Iyx0dq/dm2VV64ElMaDiTjhOa5dBD
	/yI4PAmimVPcnRS7i3sXGVUTqHtf+4D3DVg7QvYGLmIhoMTkBuN3H9tVEYXbkvM4kXiFd1KRhxL
	jEZVyXz3I8bFgN8k4GFX7spEOpDchcwxYC4dJBxGKQpXog4xxaOsdv1YBgvSBHRZIVuLZypYWRv
	o3QH616UBsZ0Je6hXTjdKivC5pECgwPZT9V3OrI0c0U0HB8C6tggNzOM/UoKh4kFipJMYbgaGVk
	1CWDn62GcE9oJbmz7aY9ZujoOewTPvarqvX6mvPmMxe1wn/f7CsR8LZAkM0krnxyjBHTg0NXkGv
	y5lE94ZCV9i5epNmQRuMdmexk/nPj4D3v0llfNOZG9sTiYRTw2G2bj2RwhKMR/+8CGa+AUQ+AD2
	Ff/+LBuNii4k242rqgpjPPe1TnBHUecwdG8yGSiUsabxJDiIotB5qqo15h0P9XAktF9ZWrBTwCY
	EFIhIjU75Dyg0WCjKoa/MscojF7SudiVbm7Y5y9YeM5ku+7p
X-Received: by 2002:a05:600d:864d:10b0:49f:e941:d6e with SMTP id 5b1f17b1804b1-4a1fdd399dbmr10139275e9.21.1792562455713;
        Tue, 20 Oct 2026 23:00:55 -0700 (PDT)
Received: from john-desktop.station ([109.77.5.121])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb83ff0dsm63793845e9.7.2026.10.20.23.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:00:54 -0700 (PDT)
From: John O'Callaghan <johnocallaghan@gmail.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] clk: amlogic: Improve the issue of PLL lock failures
Date: Wed, 21 Oct 2026 06:59:25 +0100
Message-ID: <20261021060005.2947837-1-johnocallaghan@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251031-optimize_pll_driver-v3-2-92f3b2f36a83@amlogic.com>
References: <20251031-optimize_pll_driver-v3-0-92f3b2f36a83@amlogic.com> <20251031-optimize_pll_driver-v3-2-92f3b2f36a83@amlogic.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Chuan,

Jerome asked what was tested; here is a G12A data point.

On a Radxa Zero (S905Y2, G12A) running v7.3, sys_pll_dco occasionally
fails to lock on cpufreq transitions, at room temperature:

  meson_clk_pll_set_rate: pll sys_pll_dco didn't lock, trying to set old rate 6000000000

It happens with all the sys_pll OPPs (old DCO rates 3216, 3408, 3600,
4800, 5592 and 6000 MHz) but, here, only while the video decoder is
busy. Reproducer: the userspace governor, random writes of the
1200-1800 MHz OPPs to scaling_setspeed (~700 transitions/s), with a
GStreamer v4l2 decode loop (meson vdec, H.264 + VP9 1080p) running
alongside. 46 C SoC temperature.

                                       transitions   lock failures
  v7.3                                     500290        33
  v7.3, no decoder running                 250056         0
  v7.3 + this series (1-4)                 500089         0
  v7.3 + patch 2/4 only                    500066         0

So on G12A it is the 20 us delays of this patch that make the
difference.

Tested-by: John O'Callaghan <johnocallaghan@gmail.com> # Radxa Zero (G12A)

The testing was scripted with the help of an LLM coding assistant; I
ran it on my board and checked the results.

Thanks,
John
