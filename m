Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDD93AE1A8;
	Mon, 20 Jul 2026 17:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784568076; cv=none; b=Pyxe2pvShtiUpHHg8hUSsxMgWy6ItWskIt+yd51rrXUyO5WhwiT1Iq8dNMu9bZHuYt+zVmApRupKQ6DdVLP5sjsc1JTUI95WM1VhmYXBH68Zf/QzXD4VltMYwWstvV1F72GlAETf622I65swi7hANxpbI98WdWzjRYXgf1kwbks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784568076; c=relaxed/simple;
	bh=NJOVD3tVg26t37PYf8W/Vl98F1cVBHU8Vv/kFcyZaXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hIJnYy5pPzfm/oWOxlJiLOsFaqvegfBgDiMedg2mH0u9/0I1rQBo6Kn9lnBB1AuCL6tDoIdzoQnzwKpMuTYSuJd/mmb7OD1DlUFnw3xMV+Eh7f+c//5w5ga/SjwOcD81HBEWMNc7eO0FOWsdgYIXlwROZVr8GQV/3SqmI/GFA9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hxy3tsqq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hxy3tsqq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38CA21F000E9;
	Mon, 20 Jul 2026 17:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784568070;
	bh=nMCWHEF+yOf4JYBAbRnmWjY+sFr/GqPLuphWoLQDPmk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Hxy3tsqq5crde7N6V6wwP8Rrk3Ihf5angrTE6GwywRLGQdirGwf5zlXUN6DJZUrZs
	 OCBAR4As247TNGZU5n8IY1AgNi1Ham+RABhD18Q4LVtWc7T7aKhN/feHfduuRW/4Zy
	 KTN3SD8upSYounSvWZW72fotsB1mkcqb9CW7y1bzdzBuyrduUbvGABR5EqVQT822cQ
	 nekDee7QTrvhehAV/wXMcdVEY2lFc29sgGdkv9zFxyoZftDadTxVAXG6g/u2RDttGd
	 GudOovYNi3/eHNXw06PHvfqSCFNXgHTzHfl09tx2yya1u7mjs4z+s+e4xq6oQmkhqW
	 ShR0B6lilqEPw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Brian Masney <bmasney@redhat.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>
Subject: Re: (subset) [PATCH v3 0/3] clk: qcom: gcc-glymur: Tie the CX power domain to controller
Date: Mon, 20 Jul 2026 12:20:59 -0500
Message-ID: <178456806288.1732507.17090878266123589437.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 15 Jul 2026 16:29:13 +0300, Abel Vesa wrote:
> The suggestion of having the CX power domain tied up to the GCC
> controller started here:
> 
> https://lore.kernel.org/lkml/fe210f0b-692b-4c45-afc4-fc2bc5e57854@oss.qualcomm.com/
> 
> and then, for Glymur, it has been brought up here as well:
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: glymur: Add CX power domain to GCC
      commit: 2edbea82d8edbddb2a235b8f988f17b86f075476

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
