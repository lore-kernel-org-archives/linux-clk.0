Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535969;
	b=XZyt+wQ8RDoJ/OX8rYgD1n4/esO0s+wLwOW+tdQjPq30FDgQ5OcyjpyETCpzaArR2Rh6
	 7W2pMYTcY35nx52oqP7BR/6JkwaGGD1K2tQmLXTCiHPug/cGXvgsAFRl7xOJ/tQ6t11vM
	 9qiQnJoT4IuwT+C+6CHKK1/AeZQ26BYvGky6x3mr6DxAQxnMTBkwDBdYNwdUYA4RPx7OT
	 9XhIeR8yOvyrPms8nfdzEIqq8GQWHGmFJIsNBPH1e8J8Nu4Y0tDxmGFbsZM2Ei3MKcYmY
	 y2/63radO1SGyWxLXyWRjAymcOgNtNAv03mMWlPD92EymIEFnmypwAVYRC9Cbm+1fXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535969;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=bHObZ+HSjm4VzcaC/Ikrsru4sCAmDKY5/bqklzvFM1w=;
	b=xEQSGdhrdGJAeARAALwr2rCBk0LysgmJxyZqyaWCQJWziCyEIbA6Vrn5east4yo1rUJ0
	 ipdm0xDcgedFlOIAKZ5GWUPdid2WcStMG/sdZMM2Ay47faJS1KGQoXIcsFIrBJAuEXKFT
	 kQxoBP1HZfogt7R/F7vx8HWQ+7xeEA0EU0pbh52oCHwwiscAVd3v9R6vUIE9YQM+g/vUK
	 Kf/u1XcQN1xrfL2YxQSgEBFYC6e90fJeEJ/SVMUXjzpkJfefG0Ip6m7ly5ef/0ht2kJAV
	 SyxWXq2i4yANr2TsmNPdotMjBBkZCdTh7tmYE72m5/zKzoCr7bRrY2w86fy7FJWw7jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ljn+iImp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F3A606A684;
	Tue, 24 Nov 2026 15:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ljn+iImp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE651F000C6;
	Tue, 24 Nov 2026 15:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795535968;
	bh=bHObZ+HSjm4VzcaC/Ikrsru4sCAmDKY5/bqklzvFM1w=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Ljn+iImpFHBfNA9rDkG7/B8+b7dbzXUUPZMoX3lHKtpgG+uMCq1fIRfwuTxpoCUf5
	 2aX70nFxD1/zIfH7wW8Xf43mA5/dc82WjSHgDG2XPXXl2OWOReY9uk8wAntjFAJyWc
	 NTgyMuPoEKAIrz7gSeLZFJg1puMOV044F1rW1hGoNCjL6oracyzg6wUS/hgXvHmPip
	 uBC9NSFgRsfg841ZZ4BWzr7DKKi0ea1cMgxuhx2jJWjOEwFtLC00/8coSLSz4sKrU6
	 TAAkAuaktf49YhBo6TJaSHnaJkcBQ59pGyZt8B97+8KJpUtMuqoLtL2Sk9Zk0/7m9i
	 WRzPrgUWOMJQA==
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
Subject: Re: [PATCH 1/4] dt-bindings: clock: Add Qualcomm Netrani GCC
From: Krzysztof Kozlowski <krzk@kernel.org>
To: SignKirigami <prcups@krgm.moe>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261124-netrani-clock-v1-v1-1-ce10cedbfa4b@krgm.moe>
References: <20261124-netrani-clock-v1-v1-0-ce10cedbfa4b@krgm.moe>
 <20261124-netrani-clock-v1-v1-1-ce10cedbfa4b@krgm.moe>
Date: Tue, 24 Nov 2026 16:59:23 +0100
Message-Id: <179553596330.100526.7383493325025221002.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=521; i=krzk@kernel.org;
 h=from:subject:message-id; bh=AFk4DzOvIC+jZ+r4YZ5TuRMTTDyUvdKMvdacKFwL1xM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrBbRcXloueW0zJ7sJfYJuddWcBkx+ycSXZdFTh
 jDAZagtw9+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawW0XAAKCRDBN2bmhouD
 124AD/4vGV9kE061BWHGe/uAIxOdwmb1ueAvIgj09LKUpQW6c2h5Xmu3rDbrv5Umx/8xKgbgyz3
 EUJPwrXI0xnAoMs6zeP4wAAw2rC1a6o7UObNEBJQw9Zn5JAPoN4YcNlJL+0At4FAY0lO9K9qJS/
 ZNIzx2CZj/PktOmaAyNcM2fpTG8V9k1Xd1+q8YolVMtivUUr7MitOygCLYsnRaFUIgk+VBekS/g
 hWfIVwp1FBxlf04Qp0sBE7fCh5XAicyEJw272daAImwKHq3KRWftC2EVtFgRNc62RRWhq7EZqD6
 R9U+b71ZCbDk3RihJO44+S1as2oJRq5ZySkxidqmedBqsyn1/KpGS/H/ocrDyFOorasFz5aVrcp
 AfA7agcFrm/GL58Eq938d01rtue8quOdzxymJh7/MNCyAaMA43i8M+yKoUzIhHmTBvZZzIDtl4Z
 duTLcfEnNCQ/H7qs4W5OC72uRjKNZtgthUSU6zi/rSXjNS7QK4jj/SaWw1UnF+//gvaqXJsXsa9
 CZcHehDHksruhPU+7k0XrA5WRM8W3VMBVS3RnjnEqg7w3x01ySdi8iwG7d3X00lk1yJzOqgGI7P
 2i0NU7WTXoeWIM1G4JdRagZkfMW1TdsMW7Rwz/udnAtUYuK/9yw56coG53t6cXqvahIaFKyYSgo
 peNcl/S+gZ9pjxA==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

> Add the Netrani global clock, reset and power-domain controller.
> Describe its seven input clocks and provide clock and reset identifiers.
> 
> Signed-off-by: SignKirigami <prcups@krgm.moe>
> ---
>  .../bindings/clock/qcom,netrani-gcc.yaml           |  77 +++++++++
>  include/dt-bindings/clock/qcom,netrani-gcc.h       | 184 +++++++++++++++++++++
>  2 files changed, 261 insertions(+)
>

Valid feedback, dropping from DT patchwork.

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>
