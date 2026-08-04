Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0F4329395;
	Tue,  4 Aug 2026 22:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785882681; cv=none; b=TeAHj5ppAiara+xTUig4GiwExS8bzd6+UrjGd/z2bd4m4mZ+eKbavAnQ166zBqX2sY/du+n+WXZuJwa1NFV7oLrnixcERtzBe7BUT704UhsTojxyixjwxQP0FtLg90pnFcybO3ItU7BmbwQwFsApqzU9/7ffxucFTX29E8lfcyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785882681; c=relaxed/simple;
	bh=iZZXx+p+t+aQLavw2GTx5WgR7Hbe79SnIChFavfg5Yc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ip3KiSZmWE4jtUso/Nfo9ismzIlh6tCsOLCRvnSRk5H5l0plHOpHryoFWizNH47DiMrE0svZuTkGBn2VWzBq1ZBvSNkKmi+bLq73dEzhrsoxR2+DOfxa0CaXOgSf030rNnGIwesfHYZtwlby+091CHJAklkptEqdnWuRdqlL/CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iz1d5Qhc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iz1d5Qhc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F133B1F000E9;
	Tue,  4 Aug 2026 22:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785882680;
	bh=FHuCkxYCtHrWC4bx7U2O+35ieoVYxKwUTCFcm1Fo7Gc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iz1d5Qhc5lzpBpKAIprV/0rD+vaq9C9Pza7OqKvdOA/V2rsQi2+iLPk3j8NteSoxe
	 yZ6l/yHMhjBstXwb52gp8AdIrqFXh8mIriOVeb+UuqTIVYnNwVu0e91W+mW9nv6jHL
	 evSDeOnDtP09UukP6OylOviRtCuEXuQJCbg6zyOrqwBwePdncHLqSmJ3LWh28YbZUi
	 NRuS9jIdy+/j7jCBZVJjQxShpm4ryjWEWCCN8bP5axqiAnpxp4RWwoSoFUfzWLA2EP
	 1RfjwXwcjOEQK+BaRIuivx4lzOrY4jLXcIipdBYXtPxrwnojCQ7h9Sl9EvPMZoDIXA
	 Rn13uxFJZvRAQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Brian Masney <bmasney@redhat.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v6 00/16] clk: qcom: Add DISPCC and GPUCC support for the Qualcomm Shikra SoC
Date: Tue,  4 Aug 2026 17:31:13 -0500
Message-ID: <178588267271.451855.16602199105874159136.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
References: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 18 Jul 2026 18:26:07 +0530, Imran Shaik wrote:
> This series adds support for the Display clock controller (DISPCC) and
> GPU Clock Controller (GPUCC) on Qualcomm Shikra SoC, by reusing the
> respective QCM2290 SoC drivers, and adds fix-ups for the QCM2290 Clock
> drivers.
> 
> 

Applied, thanks!

[16/16] arm64: dts: qcom: shikra: Add support for DISPCC/GPUCC nodes
        commit: 58a273157af32b7d8e6fbd7930db3a5044c2ad10

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
