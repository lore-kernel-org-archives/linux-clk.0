Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579CC439341;
	Mon, 10 Aug 2026 18:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786387574; cv=none; b=Ny9RJgrh0YsrsgUycU0zMiBbt8TqDB56yNppx2+Sh+69SSfBp+575NKCzW2nHtLKdWbRDqWhrUlPVIG5b06tN+a+Bw5C5uK/li9BbzPNfjp3+L95BwpqRi/MrH0046dEbq/+MTBWH/zxT6Dj06ev1RDGkbAO3sO/OJQT+k7LDT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786387574; c=relaxed/simple;
	bh=RaeG9XWA7mldLoLxizRmpC0XSwh28u6EiFB5GwkE+Ck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VlAUb1h1RTKR54deC88GCDUHHMFjAkWJE4YkTnmC/r4xBQ+03S+nmN472+7pK/u91ZsRlgwzaD4JpKdlsvBEYH+eERKSckeoUcyNB+Vneun7DCPLnHgDIwkmHtmxgP/iV0H1cmtC0gOx/hhhvilbSKm/N6nDbJR6Y+zu2bVvAvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iWR9T5jd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iWR9T5jd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AA8F1F000E9;
	Mon, 10 Aug 2026 18:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786387571;
	bh=2RWgoTvU3gzh2fRnEHOojXiIP4h7W0FRzkSFLMiJgts=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iWR9T5jd9y28wGku0q7mXnNpVTPU/BueuuLZoYBWgANV9Sti6FTtBe6q1vFDFFgO1
	 1wbLrJbsl0xJHetcRJKx7k0ofsK9742gJ17qte9OZKSsiOxJdz++qgmcHXPWSFhhTx
	 kF0u9VB4B5W4eWyRf7UG+ngFgs9HA8Kw94YGCSAKlUN3pmEyoCDPaG5tbFqk7KvIX0
	 VhW2c/VAOimdIjenXauRyIOzjSdlKiGdYMV+uGg4xO4naz5e3mVBiHlo7fX40d6EbJ
	 pvY8+l4qMih0auWo5KuSepBu9Jjq6CMWonWMl3FrWzO+0OJZjSAVIxGYL34DtcAG0O
	 tHj2NFQkIXWRg==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: qcom: gcc-qcs8300: Add support for TSCSS clocks
Date: Mon, 10 Aug 2026 13:45:56 -0500
Message-ID: <178638756038.656675.9099433987894736177.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260805-qcs8300-tsc-clks-v1-0-e7a5101ed479@oss.qualcomm.com>
References: <20260805-qcs8300-tsc-clks-v1-0-e7a5101ed479@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 05 Aug 2026 22:17:12 +0530, Imran Shaik wrote:
> This series adds support for the GCC TSCSS clocks required for the
> Timestamp Counter Subsystem (TSCSS) hardware functionality on Qualcomm
> QCS8300 SoC.
> 
> 

Applied, thanks!

[1/2] dt-bindings: clock: qcom,qcs8300-gcc: Add TSCSS clocks and resets
      commit: ac814303be8821722c0c04f396a35298009afdb1
[2/2] clk: qcom: gcc-qcs8300: Add support for TSCSS clocks and resets
      commit: ec4ce5a61cfd3aabd7af970021a02887641d29a9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
