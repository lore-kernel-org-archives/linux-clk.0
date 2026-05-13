Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828913B995D;
	Wed, 13 May 2026 19:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699388; cv=none; b=IPkzLsv9/sheRGUWi4pEERATivSz2RkH7aHjxpOFhR7Jqj0XVXvcr9c9WlyUyXe3TrbBNKmlOmmf3+ifIjDj/JSCDAqNxN0R/mu/xR0UwFZhrNL2tpypgw94IPxN3koWnHoAkxJ3VQ1QsYqeRZbC1hDdfVOrmZQQjt95usRcsMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699388; c=relaxed/simple;
	bh=DMX4lHq89pl+hedAdwAHKpTEDp1EwLcxrHTUzFOQlwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bCvMM/gi6qlb74PXec3odcc+FX5+3Cv2wLLnYqIMz8c+QPJFy3mj/ibnrOLF7l+xB/JKzh6ymECtadqt8gHT4BAFGuezQJso/CkeVpI7rVU0duZXw+GrE2fMwV/u99bMIXvK2OtoCrLg2iK6W1US2+ih7jaXXsnhwA1gCdguXxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qwYqYjof; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qwYqYjof"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21F76C2BCB7;
	Wed, 13 May 2026 19:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778699388;
	bh=DMX4lHq89pl+hedAdwAHKpTEDp1EwLcxrHTUzFOQlwk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qwYqYjofVrnM9dwqKCSYLitZCwEdTlZKEIvTKdg1QP8b51maHt1wQOyQXdPk0zxI2
	 yopLypyv7aavNwMpRIG/kG33rDs6p3jyUhNCFTBCzrLv8GrMcJioMDg4HeAAm0OB3a
	 ZpIPy1elcjyQodRVA63/yVVY+LW31UrtaO8N9GPQiN6gqtkDDYCPT2e8fOTcXesTyL
	 sUHOOFQvhi4GGVQp4UZDCnJULSLWzCnTrDNxIzVIzh+uz3ATxfCCvo+MBgxmZWCx1a
	 CNGOaN5bjrjgIPkVNlZ9fdBbUCy7gnu5AIG5QyWmpLLJPBTNFsvKEJU5TmAJ/SH8fY
	 FqVGpM8Jb+aOw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Brian Masney <bmasney@redhat.com>,
	Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mike Tipton <mike.tipton@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/7] clk: qcom: Add initial clock controllers for the upcoming Hawi SoC
Date: Wed, 13 May 2026 14:09:26 -0500
Message-ID: <177869936449.1496622.11363930084113133620.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506-clk-hawi-v3-0-530b538679f1@oss.qualcomm.com>
References: <20260506-clk-hawi-v3-0-530b538679f1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 06 May 2026 09:50:39 -0700, Vivek Aknurwar wrote:
> This series adds support for the initial clock controllers required
> by the upcoming Qualcomm Hawi SoC. These include the Global Clock
> Controller (GCC), TCSR clocks, and RPMH-managed clocks. It also adds
> the PLL support required by Hawi.
> 
> 

Applied, thanks!

[1/7] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC bindings for Hawi
      commit: bc984356520cea884229dc6ff044d9bf0049aa19
[2/7] dt-bindings: clock: qcom: Add Hawi TCSR clock controller
      commit: eb340b092d124d9e6592b2e58634e0ddb59dddbe
[3/7] dt-bindings: clock: qcom: Add Hawi global clock controller
      commit: d6cd9d5692babcdc697cb55736cb9ab2df87805e
[4/7] clk: qcom: rpmh: Add support for Hawi RPMH clocks
      commit: 8ef9743f0b5e98ddfe217c2d58c2d37635ab6465
[5/7] clk: qcom: Add Hawi TCSR clock controller driver
      commit: 24ba8ce4c9867e4224bb22ab3a50838d073fe13a
[6/7] clk: qcom: clk-alpha-pll: Add support for Taycan EHA_T PLL
      commit: e1668c6c237ef09c1fc096ba005dbe9c1d2127de
[7/7] clk: qcom: Add support for global clock controller on Hawi
      commit: 67121dad6cba6df7f5d8c21fa432ff543964c53f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
