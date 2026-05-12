Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F44D3C8199;
	Tue, 12 May 2026 20:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617420; cv=none; b=XCGpy1xkNW7yk5s47g2a4Pk2n2KoWHKK12FfYViI9VuIRY7OLE61kcsISkPP1/PBdXAJfWNtGqUdPCiUo+sVBWDJlEDxRXHr3NQoPwFRwsG7orFOpfhcNHxL29a8pPfwR0A30c7cYEz9UrpgQlImH+Rsma6QLcaUAio0ORvdA4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617420; c=relaxed/simple;
	bh=HLzLHGrw1kXS7D6X0mtrlc7A7wZrV6Q5JPpXN1iVuic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aX7XrUz0w/JRYEIJ1ABJHS/WZ6ALsjvPjIQcZ02OhcsT4k3uO1cIwNQQ9Q1R4wZ/sSl1kF1zB6SQ+oVeKlSKIJ5MjzQkDXlCWbaP7c2pKdMlN/9vEbAUERQOCcIGrXA616Qvw6ajV6QC23mHPFSuk7pMlVLCyGBRloVN4qVFfs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SaEpqpWZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SaEpqpWZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1AB3C2BCB0;
	Tue, 12 May 2026 20:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617418;
	bh=HLzLHGrw1kXS7D6X0mtrlc7A7wZrV6Q5JPpXN1iVuic=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SaEpqpWZvFM+gycfJQhO2rRdHeRefJ1BDre2f+xqy3IPNyTGQNGWdm4iXj6dP5knC
	 k9pAnEFX7SYOSbDGJFeVyuKsw371VXmelnJAhMhbl2yP76pc5Yk23Qm/2IYGlDDBsx
	 BfDg9ogAK+llNcjxs89sOZLvP2R/Xm6Ue5D+cl6eqOt1pf163NOkMik3GM4immS1FD
	 DAv1myxsOIyrC5VOIXI3ZPERRPryQKU09aQSDJnWnh9hvOusiOGTy9tocFX+mzqFbS
	 5npcR6WYILcLljCYQCOctdiwBMgGBvzkCgchB2FV0YXDqcnCoc9cV0KgcM+p/2ZmQg
	 JsSq/PGPI0e3Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: x1e80100-dispcc: Stop disp_cc_mdss_mdp_clk_src from getting parked
Date: Tue, 12 May 2026 15:22:48 -0500
Message-ID: <177861739368.1242344.14732791462236158411.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260425123351.6292-1-johannes.goede@oss.qualcomm.com>
References: <20260425123351.6292-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 25 Apr 2026 14:33:51 +0200, Hans de Goede wrote:
> Parking disp_cc_mdss_mdp_clk_src at 19.2MHz causing the EFI GOP framebuffer
> to stop functioning. The EFI GOP framebuffer should keep working until
> the msm display driver loads, to help with boot debugging and to ensure
> display output when the msm module is not in the initramfs.
> 
> Switch disp_cc_mdss_mdp_clk_src over to clk_rcg2_shared_no_init_park_ops
> to keep the EFI GOP working after binding the x1e80100-dispcc driver.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: x1e80100-dispcc: Stop disp_cc_mdss_mdp_clk_src from getting parked
      commit: bc27dbefae6ed11376d991a2921eff806ffef67c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
