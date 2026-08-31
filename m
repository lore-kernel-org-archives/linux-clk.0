Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950013998B1;
	Mon, 31 Aug 2026 20:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788207706; cv=none; b=JOqMXT8q//l1daL04uKA8uB9LsU3vUJaUWw4AaqYa3z/R3DfAr77FbWwSouJOJqyOLARY36bMEKTcQGGMzxj3JvVIzCzKIxFYz+AimGAbkU5VIxvIEVoDodAb+CFM1uqByFtpO2k1iCGC2D0qSVSXzX6y0A31pyH7aNhhepuvTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788207706; c=relaxed/simple;
	bh=9ujT/H/Sdq6sIK8zqa5QJc5g+FFtpwFnM+fYuyOLXjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tp49KvoB+UBxNDslDiJumFXMyd+HTBFAm+dOMaXqV4VCMptYto5kOc5rI9575gCL7HcJ3HAlMbwxU1EUtjF+jP1HBlAzWCdGWH5EgbXGzlg2FkkWCbazavpbUV8SVTEEuSjQvGMES09wUg15PQpff6MGtEKMi8uP+QlCVSmmo3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UFm5+pXE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UFm5+pXE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85CAA1F00A3E;
	Mon, 31 Aug 2026 20:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788207705;
	bh=3qoqd6zz7zGvz8fi/Df09tcAqxvikWxckkzLnaqVQR8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UFm5+pXEiGEKGbKMHKEv9ecUoVkcMRdT8+P17mWxYyeXCjigM1FcedkBVR3Bqz2Xh
	 OldeefhROHWLv2aFQtzWzSbpATvBDJQdAR4yoEFknzIO2h/lByh856sNys5pF7FC4L
	 uhDLHZz4oH9sH++QV2+/FL4dixMFQjof1eZPiFfQWdPXy+tbJihXOtMjzP8LjM66MB
	 1yfomCXNV+1IgQVs2zy6YLd0gKzvx/p9RTEuLDOE1hFKYtOjv7gFCMtmPjKTB08dkG
	 yNHeCfN21QB6B2dPwFqNGHaispWNrT57bCZ3Qx1UAWh5cotJPBNEBrRqjlx+2mM2XJ
	 FvY8YWlCD5YZA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
	Mike Tipton <mike.tipton@oss.qualcomm.com>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT 0/3] Fix always-enabling PCIE_RSCC clocks for multiple clk drivers
Date: Mon, 31 Aug 2026 15:21:22 -0500
Message-ID: <178820768663.1699313.6258992575015868536.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807-various-pcie-clk-fix-v1-0-5caf78a599d7@fairphone.com>
References: <20260807-various-pcie-clk-fix-v1-0-5caf78a599d7@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 07 Aug 2026 09:46:03 +0200, Luca Weiss wrote:
> I've noticed that the .clk_cbcrs list in multiple clock drivers enable
> the GCC_PCIE_RSCC_CFG_AHB_CLK and GCC_PCIE_RSCC_XO_CLK wrongly.
> 
> qcom_branch_set_clk_en() will be called on each entry which will set
> BIT(0) to enable the clock, but this is wrong for these two clocks which
> -- this is also why this is marked RFT -- at least for kaanapali
> needs BIT(20) and BIT(21) set to enable them.
> 
> [...]

Applied, thanks!

[1/3] clk: qcom: gcc-eliza: Fix always-enabling PCIE_RSCC clocks
      commit: 5ffd02d16f4e2f0566b8f31d5610538987e1944c
[2/3] clk: qcom: gcc-hawi: Fix always-enabling PCIE_RSCC clocks
      commit: 62bbf7ed9ad97c17377377aae50b7ea7feb9464e
[3/3] clk: qcom: gcc-kaanapali: Fix always-enabling PCIE_RSCC clocks
      commit: 0bfb542fc3368371cefb4cf45ef21c3ba2d37c3f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
