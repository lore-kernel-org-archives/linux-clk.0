Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED55D28A400
	for <linux-clk@vger.kernel.org>; Mon, 21 Jul 2025 08:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753086295; cv=none; b=rHJdR6aBDwGYCn2oZtWIljHiXTETNQgVFEZC32+ni1+5ZbrwYD3tTaOT+KqiiD8VlfUOG3ZTuAk6qnGcYLNzmLxpeZUmapnwbm/itZM97JxaeS9TtlatofEqVDXVoOdqPYvls/4AEogZvqyVOBB8sS03PtEtF3e36eaYxyNLP+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753086295; c=relaxed/simple;
	bh=GToabdAjteaGCUpBSIfqJ1avVfcQNejcqdkif1y1MYA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kAYmWfdbes33dZSIDCoFGL/Is67bsqjAQcPp6b/Or4mYw1Af7ElnnvJQbLdo1iAZsaA6C4Ha1idq9QpAqvk/o/5d1Fk4P0dnT4P++WQFsmJIIveXC+dEzWpVugtpi4vnE9sbnhZ21gFGoHh/f2JJZeyqJD4Zh2SRst/A0ebT+Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EQcDS4Pk; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EQcDS4Pk"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-60780d74c8cso7150538a12.2
        for <linux-clk@vger.kernel.org>; Mon, 21 Jul 2025 01:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753086292; x=1753691092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdywicGMC8PWpQoI79nyLjxZDbmHom2ul/36bE097Ak=;
        b=EQcDS4Pk61Mgp0W9F4tMkGkQC/6+O6oGY2HLrSlNNGOiFjNJIwCU8L4GW7tY3GC7yN
         G0hDdYRszLA/IOpOpgEM8Z99MABCGKKPP0XSxCCQNUqfNT9OlqK5yfg029RUm93mDQwu
         pSUJiJgphXPw8RDy5Ae4nsapbsLJuvVtUYnA6/IfCaEQz82LZVsp02k/9ng/uYUqFlTq
         SOMLOH1mfDxuEzGAu85vEtdUAPDyCUMVx+1sz6se0z6lm71MY6yIrA7Fj+kCnzdThoP0
         B2X91Z8Ve6C655tcqPUzHGWHQUy/NLaJ4voOGTZ9lfmdtvJl4/Y6Nvq1miPuyS/6pmMZ
         WRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753086292; x=1753691092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdywicGMC8PWpQoI79nyLjxZDbmHom2ul/36bE097Ak=;
        b=m20gWUluVXg6kh48hXHQnZlhwPjgBucenhzRWfUXQvN2eRmCebYC+Q0+u66eRJHd36
         YopC19H6wlQwKSN0lVHI/LoPiomYGd8Fykp0QAAv6XvBY49ECzEw+6+/sg6PDBdtGlOL
         rmAzBRIbYP3AbEzoughuuWfoEusolDyfSGZw2ldLrdvKjHhCgV4vJhNovZeb6+7opPHP
         QqM4WFkeoEloSz1c7OzfDjhTBEeFJHSW6taOm0nTaO4LXe+50+CE0z9Jkz9HF+bKMB/y
         OE8GlYu/G7Iv6fHcajey5+23PxcG202PiaGnUG6EDakplQNo0L6hm7pN6OarlX/WvrAV
         icHA==
X-Gm-Message-State: AOJu0YwjnphnHJpfCd00KnNVnxgW6Ga/XW/o5TfyHxYhIZNEsPpD35vz
	P1Wui6DGHzjqYZG1jXKc64ANFzSavfeqr5F8pnUGuwxNEzbhO1r0WBAqneAcuLPkvE4=
X-Gm-Gg: ASbGncvcfRdtXxFV4OGTVWzetCOEDNjC0UVD0WuXMuKDNzbvSuvKlHGVH9ciYo2dU88
	d0jdqDClOzeqEc1HT7eWMQAgZ0rlDTB2MfQnuQ5r2XsoBJl5mRQDylUvUiX4frvpsDpuVJ/m2qY
	Xwddbkx86rts3ZAtAuQpwutz3+JxGIrgqK6Z5ZjX76jUK75PUnEGVCVt831IuKreEIPmyElrD9g
	mUYeHXHnmqAexOZdPbEszSgC7ZjkcD+ud0rU1/T1nzCZacVrNUGp4niPoPM2fJPUusfXe/lw/vj
	OlcYD1Wy9eiRCjGRtSPw6RNItqmlCeFOA6HFaCICQQWrhxPpaLFroB7ZpReYG5K23eWxYlolL6G
	D3JF+QEtNlzofFUKa76Ix
X-Google-Smtp-Source: AGHT+IGXBWkrr0OYxAUb4JL3ZpYz7yNfjNojugUdotLeKq4sWMewk8MwN0wQ2Tv8Q662Ax1Tz4MBzA==
X-Received: by 2002:a17:907:1c17:b0:ad8:ae51:d16 with SMTP id a640c23a62f3a-ae9ce198bf6mr1960198566b.55.1753086291837;
        Mon, 21 Jul 2025 01:24:51 -0700 (PDT)
Received: from hackbox.lan ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca7d330sm633826566b.126.2025.07.21.01.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 01:24:51 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Frank Li <frank.li@nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sandor Yu <Sandor.yu@nxp.com>
Subject: Re: (subset) [PATCH v3 0/6] clock: imx95: Add LVDS/DISPLAY CSR for i.MX94
Date: Mon, 21 Jul 2025 11:24:46 +0300
Message-Id: <175308625432.1291588.12529765608002208630.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250707-imx95-blk-ctl-7-1-v3-0-c1b676ec13be@nxp.com>
References: <20250707-imx95-blk-ctl-7-1-v3-0-c1b676ec13be@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 07 Jul 2025 10:24:36 +0800, Peng Fan wrote:
> Similar to i.MX95, i.MX94 also has LVDS/DISPLAY CSR to provide
> clock gate for LVDS and DISPLAY Controller. So following same approach
> to add the support, as what have been done for i.MX95.
> 
> Patch 1 is to add the binding doc.
> Patch 2 is fixes when supporting i.MX94, but the issues are
> also exposed to i.MX95 even not triggered. No need to rush the
> two patches for 6.16.
> Patch 3 and 4 is to add the clk driver. Patch 3 is almost picked from
> NXP downstream with a minor update. Patch 4 is modified from NXP
> downstream with a few minor patches merged and updated.
> Patch 5 is the dts part to give reviewer a whole view on how it is used.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: clock: Add support for i.MX94 LVDS/DISPLAY CSR
      commit: 0b0cd1857b783711b4bdfb8eb513c263b8a84f6d
[2/6] clk: imx95-blk-ctl: Fix synchronous abort
      commit: b08217a257215ed9130fce93d35feba66b49bf0a
[3/6] clk: imx95-blk-ctl: Rename lvds and displaymix csr blk
      commit: 88768d6f8c13ede81b248177fed3ac285499f77c
[4/6] clk: imx95-blk-ctl: Add clock for i.MX94 LVDS/Display CSR
      commit: 9678bc7661cb34bec4be92685039eec68ca67dad
[5/6] MAINTAINERS: Update i.MX Clock Entry
      commit: c78865241ecffaff7ce5db00ed5b71c1a70c0ff1

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
