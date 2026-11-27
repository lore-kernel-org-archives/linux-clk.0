Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795793223;
	b=qxwgeEv67hb/zxT7OsQj6alSSsTV4wcBwFiTlaX4gmgkxMQHC3xKKborCofZKiEiZKCY
	 wJpt7rS5METnVk6OT19g9/1X/BeHmAzoO79CVWNfwiL4NqyHBA8vzIPAefpMlRq82RoV+
	 guMquJBvUwBA8L216sorLnQVFyaCymwnSMzrhb7/2dF3pM2dJNWTgggbHcdLXzP/UhjsH
	 CMgidIPIUkmLgoHYMCUdSacxNM9zy3WRhS5F6vPp3p3Xv4inKLdUcep04TdKOrFJemUOH
	 LbuXqQAlsutGSSMdCxFZJ6ekoC4WWjjI4XEXmCRyi+WbjbqEhZBSkqQctkHCf5ofpjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Wctjo3j5xh+nTDA29yMIw47VYYGkIaceGn1gzPZ4u50=;
	b=uinBPMkyUH57Uwzaj7KhDM2sk3GVy4y4XVCvCoCh6a0ePluJxhQFSFBxO4ql2G8GN9V5
	 ++my/Zi2b4shUF6wii+Vix/ZwVFHP7HVXTFKc5WpJn3M2xzglCdmNlsJ6B5LEGnagvYb0
	 8flu6LVCn14FOMMCh7EnIMMlFfHn8DJC1ofHJRkdakLT6fqPJXS0wgrPxLvFgp6M1m/PR
	 NzR51R0437PttDDAuqvmBTWaVkt60rdtTvggUbigmsVUk6ZRNIahK1fRoOKzh+d0bvPPP
	 SJCNfjAHbvP0jtWJNeYAJW0dJ60SKMcLFstpmEKSKprHJ++MR2kaq+fGg2yQZ6eaTXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=NRTGBcYH;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E38606A31C
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 15:27:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2E38606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=NRTGBcYH
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so87530035e9.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 07:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795793220; x=1796398020; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wctjo3j5xh+nTDA29yMIw47VYYGkIaceGn1gzPZ4u50=;
        b=NRTGBcYH40OSOj7TusSpvA4p0svJSrQ9oAhOaBvt0nicfTFuA4nYQ8Uv2pdW5LFytu
         QjukufKnKP0Od/xhPv8wVvPeqTcdVvkOh9jeO5hzOKRC7/gX/TWQ8ipMubBe4oHCoLPC
         WnZTHqA7DxE7wg6zQ5VkfqMVjp1SFz6KGArlYyONXGmpsCj3MgFiiyWa1fbxjJBYfeW6
         dZO+8m0T81GA81OEpe4onpAYU3fCFGFvy7YpA9k1X/OzLXf6XIO6ZAXqQz8gVZYsUJSQ
         FUKqrbceNRKMOcpXPps7fomzzy+8ELsGJ88Dp+fuutZDbZhQG4ozVSqNHiiPYVtjeCYF
         5PTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795793220; x=1796398020;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wctjo3j5xh+nTDA29yMIw47VYYGkIaceGn1gzPZ4u50=;
        b=Tzl+kD3uiJ8tsQ7xaybxuVDfhJfihEDdCu3jdjGTuF1x89QqG6/+QxxUWNkq6wLw6R
         F6T4pS2lo6loty9B1fFX7jfbnCT5jPPMb9v3uz97th2N7jQlTbpD87EOdEbl8VAjW8ly
         4K0QZuKpZsQPzYU9tm/FisikYpAC8WCa/ykmRiFVSuKTDzBVIC9682dzy/bY2tcmxkLW
         IAnoqstK5NUNV31hBHClq8yirjTYyHZ3cu6AynPPH+gJAZkBYczN7f1kf2UHIqS8TJhg
         slQN3M8sPFDtBgMZ/6z5NmO80+DM4w8UjAeZU51gEms8hg3/M83h8XMr+aiDUQ6TxmVO
         hQ7Q==
X-Forwarded-Encrypted: i=1; AL+hErHIvf9Ps4vVSRCDwE4JoZz4Qstrnt3EScVhzZd3KL1HZvS1l8Y/jdAeEK8MfuBweJqPdGhgZEZBYvc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9N+JD9hbX84kfLRdLRMUVzYifuqAeMoEzRLzDMRZ3tWeNSfHEH
	LNEMkZiCwW+17Insqbn+XMjJZAov8MzbcZU0Zm14dGnXdYrDa3F9t420KdDI7ULRviE=
X-Gm-Gg: AZFdTZePBTAjSGELM3u2peqlkuZsr4MZ7t1OKSegwdAZkk/dV4rttmRVRnBHa9iqA8e
	nriKZRjF5m/N4Vr44eemNxEZN14h3AzCxul5SQjRSZUBnzFLPFE30k6xlGUaZiP02a3rktchtGp
	qhxVUUFIE9+PnC6l7U++TspArNi0TfyjdxeRNVg4+CDv1DeRxNyTliuZLVnCUnHUchVyBin42Kj
	Q+d6OMlkXq9lmjQi3Nsxh8oLOoB1kvweQ7m292kohlcELPHxHVz3cLfMSkXBAwUJkputuOnWvTe
	enfcGgurtXbzcZIgvwH7qhoPfcC3Et0aP74uIBQ7kFP1rzMXO0qHaDnIr8SXnTzx1YkchG4rPmK
	DxKI10zfKPGMgbnfm9yYLPyWcg4/MK9oahBaiFzELLxWnuDr0dFgrhkD8U+ywkaBgOvg65l8V/A
	G1jfzXSCZSL1rQS6wSEtPDRsUkB5Y5g4BK0nrtaLeHUg/DvImZximx+9EZ3gfNLIvFgEHxCaC/s
	a6kbFa9RI/2oeT9zjwRiCpvXSIChEZ3lXNNUKirTSVprHIUs3ca8FhvXLzvsfPTpz+IuddtJNmV
	gTQGNvJKRqX5sXqFFoaKzAsBQsfAxxHoiw==
X-Received: by 2002:a05:600c:638f:b0:4bb:6752:8400 with SMTP id 5b1f17b1804b1-4bb8881a2bbmr466455455e9.17.1795793220422;
        Fri, 27 Nov 2026 07:27:00 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm638871535e9.9.2026.11.27.07.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:26:59 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20261123112053.20400-1-changhuang.liang@starfivetech.com>
References: <20261123112053.20400-1-changhuang.liang@starfivetech.com>
Subject: Re: [PATCH v3 0/6] Add System-0 CRG for JHB100 SoC
Message-Id: <179579320502.2809466.14495045547675312839.b4-ty@b4>
Date: Fri, 27 Nov 2026 16:26:45 +0100
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
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=831; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=KeTHYnFw/STnF4LfJvFYzXH+5eeixkax9yQCIss38Ls=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcC519mZ7s3PhhjdU1Ta9iDvb9EsnX9J9MS7zT9yyI+
 4TT7Z7DHaUsDGJcDLJiiiw13NXi7yS1vsyarnMbZg4rE8gQBi5OAZhIiAIjw8IVoqazU+8J5G9Y
 JieY8cJhmswq+5Nv1gu6McxPsV7F5MrIsLR9Q60Jz/nd+2Sm/a0K+P+s4/ASfdE5PDVN718s29b
 GyAUA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Applied to clk/linux.git (clk-starfive), thanks!

[1/6] clk: starfive: jh7110-sys: Fix memory leak in reset controller register
      https://git.kernel.org/clk/linux/c/42af5dd8aa0f
[2/6] clk: starfive: jh71x0: Move reset controller registration to jh71x0 common code
      https://git.kernel.org/clk/linux/c/fee5538fec1b
[3/6] clk: starfive: jh71x0: Add generic CRG probe helper
      https://git.kernel.org/clk/linux/c/32d9081dad72
[4/6] clk: starfive: Add JHB100 System-0 clock generator driver
      https://git.kernel.org/clk/linux/c/682283b20e90
[5/6] reset: starfive: jh71x0: Support discontiguous reset IDs
      https://git.kernel.org/clk/linux/c/b93db125dbf0
[6/6] reset: starfive: Add StarFive JHB100 System-0 reset driver
      https://git.kernel.org/clk/linux/c/d856a10191b8

Best regards,
--
Jerome

