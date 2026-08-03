Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5175138333F;
	Mon,  3 Aug 2026 03:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785727474; cv=none; b=s04Ck5sfWYMZGHavRdu1OiB57zLPrnl+YPSV8AieR92L4xvPkAnEesRB3Qm/5VLiXphla43laXYqfJ5YDhGzQQYZHCRhQC3Puk1NrgGiC8XRVwUNqv7EXrqO4MZOkXDLt4+d//sX0DfibNbUXOGU5ls8Qafwb6Oah6HCf2NIh+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785727474; c=relaxed/simple;
	bh=nF9JmbixLFY3qRDdQW3RqSM/78O/ELsARFHwiTtxDHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fdyaufQR5+d8YjKqb6g/YLQgr/KkWrg++GnxJON60kkDN1/w0FC86QUSz5wTno7zeb82w8zI7byOjCgnFQB24SvLMzZk7ugkgmdpoH4MvYWxDO54tkNEuotYpqWQx++J6X3x7FI2jrKSRRBE52SYbW7uOHLrx9gV4N7yL858LVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dfWuv81n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dfWuv81n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20F171F00A3D;
	Mon,  3 Aug 2026 03:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785727473;
	bh=jwypTDJipm9aNwUQ+Gfsqh16qBeuRCXeDsbo6nrhIVU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dfWuv81nSDXCIE5rS7bJyWbwNTdlDYOnC1GI3GKrIe/SQhdbVXGIwFW5xqqgUhAZJ
	 gEVjCvb6Xb5+DnNkRkZ1t0vWBJ+8P2DySixzFrVhQHqxKIMzB81nrJbe4IN0wbfXOU
	 exGKLZiEzKLVyVKSuHOyszUSwc+OLIVWaXzdGQLMhYWHfqpzFllGy794XninIJRKHG
	 TV204/5ubMLmL21OmGi81wyJV5lkfHpzjs0NKUuSHuWMNPqn6S0ntSbG0BDWnko4sP
	 5MpmVddBSDTeEdSKaiuDWARAiGjlChsvHVt0rJYmA3I9n4KGkBv3ubSHXFogA2NiLn
	 MNBe150khRlkA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/2] Add APSS clock driver support for IPQ5210
Date: Sun,  2 Aug 2026 22:24:05 -0500
Message-ID: <178572744555.408250.5529471482065457058.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703-apss-clk-v3-0-4785e89a9c58@oss.qualcomm.com>
References: <20260703-apss-clk-v3-0-4785e89a9c58@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 03 Jul 2026 10:33:46 +0530, Varadarajan Narayanan wrote:
> IPQ5210 uses the HUAYRA pll for the APSS clock. This series adds support
> for the APSS clock to change the CPU frequency to one of the supported
> frequencies.
> 
> 

Applied, thanks!

[1/2] dt-bindings: clock: qcom,a53pll: Add IPQ5210 compatible
      commit: 4af10c020e29607dacf1e06e98aa4286cf71d4c0
[2/2] clk: qcom: apss-ipq-pll: Add IPQ5210 support
      commit: 546e0bc2aa207f7e9c78c88b0190b0045f796169

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
