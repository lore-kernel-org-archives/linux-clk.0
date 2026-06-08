Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15973E0C73;
	Mon,  8 Jun 2026 15:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780931405; cv=none; b=ad9US6romTAhb3gy4sgSOUSmg0ihQQ/ha+/dFXlqr5fmY5i4k6Da92b7nt72Q4YZR5gg6asd+vI3B71uPqyzZH+BE+zn/wGYSsg9GdlmMB4xPJKGmTYO+0qTEDLF1kClvbWHDvhMUwU935eFwVXDVooGMRV+/cSTgWBi43911UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780931405; c=relaxed/simple;
	bh=lKhMFaF7SoHcR9+d2yQvVGTv039v5i90jFkig/r6o68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eksVoqlrBek+l3uxU0gFBMPW6cLEx0ze7Qrqbj0q+aggLcH4FB549Zmjeku4vX3Lo4VZ4/7sD3seTkK4OA8UQvIFfz5Jn0E5ERrit1fshud8U9TAjzKFX7neNBVwMHZI52m7B5HuSd+ta0RQaditZwkQdlU4SjmeMwfGoPVZc3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yq/DqXFE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yq/DqXFE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 566311F0089B;
	Mon,  8 Jun 2026 15:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780931404;
	bh=rhqJfRINulrdxXTK9fYh9Ep1Zir4DVzNWwSqx6ltEPY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Yq/DqXFETxHtbhPivSk2QBS3kIzH2eS5w++cHgSFCVQsqexBvX5kTuxW/aG4OYnQO
	 vykiyIn7KrFfpII6FWAz27qAJWEBy78m12WvKEWYzg39zXosJuxW8O6eC8Zx1bbEGk
	 ymZj84bc5MIicqZ1G5PUsP7xzSTyreQfTaiBd3QfQhOt1j7xu/sBpCZADllGbiy4ZI
	 NAGBeLEBTwML4ozcytQI/qtQRrQqsFUjcjokwRGOGXgupthRj7ydIu53zvnPbFs8Wa
	 0NFAOwIm2OkJIJ+oXOG+nOHgdpNamxuE3Ovq1KfDBd/c+zICyCRjN3mmQaj7z9aM6S
	 R+TGrwjxqyYeQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: usb4-upstream@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: regmap-phy-mux: Rework the implementation
Date: Mon,  8 Jun 2026 10:09:55 -0500
Message-ID: <178093139446.244194.9422100472802070367.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409-topic-phy_fastclk-v1-1-6b4aaee56b90@oss.qualcomm.com>
References: <20260409-topic-phy_fastclk-v1-1-6b4aaee56b90@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 09 Apr 2026 13:57:45 +0200, Konrad Dybcio wrote:
> The sole reason this hw exists is to let the branch clock downstream of
> it keep running, with the PHY disengaged. This is not possible with the
> current implementation, as the enabled status is hijacked to mean
> "enabled" = "use fast/PHY source" and "disabled" = "use XO source".
> 
> This is an issue, since the mux enable state follows that of the child
> branch, making the desired "child enabled, MUX @ XO" combination
> impossible.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: regmap-phy-mux: Rework the implementation
      commit: e108373c54fbc844b7f541c6fd7ecb31772afd3c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
