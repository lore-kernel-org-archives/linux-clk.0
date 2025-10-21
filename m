Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B96351FBE
	for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 19:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761074833; cv=none; b=F00Xa9+SlfzQfEzGPZwfbnWSA06N3Ey5nQItbGabIoq2aQ+jWgqblqkIBVpWwsNvnmNinewIRwmZF51eq8QJdJqh2MdnzHCnkLp+L+GysJbHmURVkBwZUgBVLLs6epezLvPPResQbr/HZ99l+uMRO27BHv2kkVoRlSBwg6ZKu5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761074833; c=relaxed/simple;
	bh=80lKMAyCvwagR5exBQfzbE8bJPhC05JQJ4q2PDAq1Fo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LBKUCehz8uQ9FYAAt/yBpPnmCOM/kb1HzFV+M+1iz0sU+A06rm6O8l7/nKH86DLkkcUH++5BdLS4K5zAEz1WfUTuvx+alC0GAigDQwOhsnj/9BoUcbf3kGfC6qprL3RXeE4hh7msIRuwGT9UeLrqVSjpkmKZgm8+SrHCCT9Ya2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sOoe/dQO; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sOoe/dQO"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3f4319b8c03so667988f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 12:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761074830; x=1761679630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d5/SqlA3X/ZkVhbqceO5ccBn+9e7HcyK50UX+eusqGE=;
        b=sOoe/dQOi1vedCzQnCcKxUCDdZiKcemRWrNDPq7LUBVYGMz4kBCumvHqA0IMi3IZIG
         wAxXCAxmeIoBRzRmc/sbw2BKbiByqz/3smmLq24lskpjsf9e9jc/HyB1eU8FPdTiY2K4
         PuTJUBLrNtov0qKXUSvBwGKGZIRETxr7jNESYv91xec1cP5tUz0jBBUnI5oCJVVBgk9W
         eEcZSxv/eoxH8zgYKHDbDmV/38DrlFhziaccDlNf+jKP8kAL/vU9N877uvCPnQPARlPC
         ByJcwneih89fRUxzT/FqEXzBR+jUGJ3l5n4XDEbGx5sNgvGCJVOKaB5terYi6LA7RbB6
         PR9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761074830; x=1761679630;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d5/SqlA3X/ZkVhbqceO5ccBn+9e7HcyK50UX+eusqGE=;
        b=PSUTTYpSaBVmfyqgDPR40ZI65HidLI58Qi8/zt9uAeIVBx1bk7kftRYU02GO5X/c1H
         MKLgeVAhvT55P++V49keFsFH2qqDMPZx7/2saxyGcHRHlV5AgqSp5h0P0IwAqqVpDywG
         Ev2I8slAqgzZsGaKPFSDZEyTf4lbNVAFDz5UhiwPwuyB8MCYZS2LaVawhQFWHAz/pAHm
         wAOq0fUxFGOZ9sZr/4ngflGpur5XcQCIO5D6opYNcaf90tEnetFm7pFEsjfXVEyBd8h+
         MR2VhcQpPSSLi/FrdDz09FOWaY5b+rFMGQb7k02grNnjc3obFPI/vo2k9TL1aD1n60bZ
         CxIw==
X-Forwarded-Encrypted: i=1; AJvYcCW+mQdimRyMvCcembS2AHFi7gICfB/taer1ELK6UoeH59d2w1t/6EJbYklIuQp4B+o00yrgXn7e3VI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXjnO+sxsit1GAA/u2lcSHkWonZg7YxmRPQfH2GDk6PeURyqcC
	DXZsJ5D8JbhcEq0bFQb6sxjL1jqAOJowA7mJcL4Ro2awzhmUHm1C8SnMsHPqZVeRKdU=
X-Gm-Gg: ASbGncuoi0xRWlaAnRzQXffE1Mn5zMY1zc11r5E8yjc2m3M8HI+8noe3PxI+ZVljnUI
	4XM2maMutcvd3UnBFKBH/JyaE/TYRLR0z0P75xFm7GjyAJNiz+Bc+gw+qv9y7qeDpz9ZTAbU8nu
	EgsZlzWTfffturtSzuier93Ud5d7HyUrkeb+AXu8lGSEtZkccdOQJtDF8JLIUriVTezxZoTLPo3
	dgX88MFHq8RaonD2Or8S8vkKc0Ntr7Nyv7VZlFmZrLrzqujxKnK98r1GWFt9BrJuNIFeLHbGIha
	nAETEsveqdjK/R11uMaj4/HW5aLIbqMimL+aJ1WRd4R0tJ0wrhYGTvdzdXRHfVnHEOaDBO0I830
	G5EBorZHtXcZnOgrxktHBSohP8os08/UlSFN2o3FJBK/9Vg3IXMIqSiFvHrbptA90q9NjSxH7gT
	nmV7cNUvVjbj6hMLKZmkCuHeCo4SA=
X-Google-Smtp-Source: AGHT+IGAOoUW0XD9+qwwI+PbL9VG+MrdXs4rR2dEuVGyu8dEGa1T5rx/ZK+RB3yRzWux75q9C21zPw==
X-Received: by 2002:a05:600c:3b9d:b0:46e:5cb5:8ca2 with SMTP id 5b1f17b1804b1-474942bf7b2mr23336545e9.2.1761074830178;
        Tue, 21 Oct 2025 12:27:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c42b48c9sm7839115e9.15.2025.10.21.12.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 12:27:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 kernel-team@android.com
In-Reply-To: <20251013-automatic-clocks-v1-4-72851ee00300@linaro.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
 <20251013-automatic-clocks-v1-4-72851ee00300@linaro.org>
Subject: Re: (subset) [PATCH 4/9] arm64: dts: exynos: gs101: fix clock
 module unit reg sizes
Message-Id: <176107482865.33931.12362645662957210185.b4-ty@linaro.org>
Date: Tue, 21 Oct 2025 21:27:08 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 13 Oct 2025 21:51:33 +0100, Peter Griffin wrote:
> The memory map lists each clock module unit as having a size of
> 0x10000. Additionally there are some undocumented registers in this region
> that need to be used for automatic clock gating mode. Some of those
> registers also need to be saved/restored on suspend & resume.
> 
> 

Applied, thanks!

[4/9] arm64: dts: exynos: gs101: fix clock module unit reg sizes
      https://git.kernel.org/krzk/linux/c/ddb2a16804d005a96e8b5ffc0925e2f5bff65767

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

