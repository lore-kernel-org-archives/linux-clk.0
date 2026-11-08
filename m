Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169426;
	b=1VD0qSs1A1fkylDofWNZeGUSzSWGWAG4fMqpIbUYSCrEv3IvOXtwnPtMWXS7+wEAxo5J
	 AvzSzBQ/LuvRTsMdSKUtvklXyh0tCo21YwyhvwDjb2+NuuvviEJSGxa1p153UfTAKbkDk
	 zjSjshyvOszxb3cmT/fgn+LTQQ64VRElOyhLy+Pr1MM+bPz6xv9lO3yVfOf9SS+Y2i03J
	 0EBSCHPlPd3scvoHSmTtD24UwsvdxZCusuANnSUfFnGvzCLmxHf+o6i/q1C0ahiFds6lF
	 r9y81D7IVIyT9zxgsvlUUWEWfG6YB7oxfTMSeH1L5V25v+baKbiY1vxkTzSDAOjRtNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169426;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=gNp286dN1y431e+JOIpDAIsE4dpizj4zLtHy+AApvAE=;
	b=lxhpXs8LeK8Ou4POfqjU6t7IUU7sdEiGAWo0dOt4+Ns1XBJTuCxV7Pdp9PGpdOzsri0k
	 ABe6m94OqRPErWHFHLeziyqtMewYTkeXr0ZAXamMHqZ2Gjr0KuvRf8EgJ5f+9pgtE2wqk
	 +c0mk92j3oiDX0BzltLxHdYCJBIvCDaQ5GqTM3LlbKtJQdzIUIKOuUOfhIIeKzvHtl3kP
	 bwLk4LgLo86ijp6bB7YWuNUNuZfMUcsCBTIV7GXEwZhQ+OjM0OrfPCHFyYaXQ3DWcUAvz
	 hmCdOhC90TSGERyG5g3/GySIj690TPVWbCES6vL1UK4Sj1TaXccRABe8l3Ytu68qFnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BMU1IkxK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEE8606EE95;
	Sun,  8 Nov 2026 20:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BMU1IkxK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F8951F008A7;
	Sun,  8 Nov 2026 20:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169425;
	bh=gNp286dN1y431e+JOIpDAIsE4dpizj4zLtHy+AApvAE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=BMU1IkxKqnp7+JI5D40+iApUJYIAYoXFCbjfuokWwx7qob3gANj4ER8ViEco6iLjw
	 HQX2H5WWsavERbTqL8SGw/EI01s3+jU6DsD+xNxtBqcs6sVHpuazmXJ3gn9k+EnE+K
	 lKWjeJ35phLnnUit6teqQ39kCwGyprYbsPEvwgCrLznJxezaZXfm3xsUG8vtFzRN13
	 X12M9/OczmwhN0Rr10fOFY6tM+g/jRcaQjrKkvQB0LvcV0VHtE69YVaKphMLwKXPkJ
	 RfFJXV9TQsvgGbnfGCtZWjl6mHWwHfFbPpx42/I/0GPf1Q5AGcM/LPFlec0ZbIPXNd
	 kjUjfMAx3aczg==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Danila Tikhonov <danila@mainlining.org>,
	David Wronek <davidwronek@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
Date: Sun,  8 Nov 2026 14:20:27 -0600
Message-ID: <179416929233.628393.7856728142051372012.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827063940.44497-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260827063940.44497-2-krzysztof.kozlowski@oss.qualcomm.com>
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


On Thu, 27 Aug 2026 08:39:41 +0200, Krzysztof Kozlowski wrote:
> Bindings for Qualcomm SM7150 and SM6375 GCC clock controllers are
> identical, so this could be one file for less handling and encouraging
> future grouping of similar devices (like SM7250 which also would fit here).

Applied, thanks!

[1/1] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
      commit: 12a5b06075dba5d6f803cab8b5868bcc5bc2b6e1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
