Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4B915CD7D;
	Thu, 15 Aug 2024 20:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754480; cv=none; b=cQYZ2wP5ILNdkBA5zlnfKxeL40N4lDAm1YiSA/uq1dhMT/WVAgfQeGo5fFn7nnsz04EmMVutXSa1iTfgdvB7LbQItXwmJBd+Srpq9vEqgX4qMldvcZVCXdtBuZsSncU8BG7nkavb4pOl/bLgZXVLoLY4QV0ugZ0tuN5db2VxVLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754480; c=relaxed/simple;
	bh=Jrqy+i20EJPAMH1+e9pvE1WfqClr+h8MH439OCamKjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EuFAJ177QJ3mNhfb65Twe5jkPpuTNK9UYAJfTKAgYOWTIK41TQuFCEBxV0cqBhp+CbVQ1dwjmY69laZ3FW88cKUaeqk38n9lzZwcpurElfpXWfYliCCdi9fjo0QBpBjRUHEfMbYut7G97A7O+e7nnvbMcX4IoNr7k78B6F0DpRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zp+RfU5/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zp+RfU5/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CED7DC32786;
	Thu, 15 Aug 2024 20:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723754480;
	bh=Jrqy+i20EJPAMH1+e9pvE1WfqClr+h8MH439OCamKjY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zp+RfU5/pAjNNGrK3uDF8mZ9cnXd1quYOC0+q0MijO7mw6P5SS9EOGhc1B2dJDydK
	 BBh0GeevmxHdh1mAlJh1WsStppC2zpvuI8aEud5vi5z9K7pu9FhElc2pkRFpMrlQqT
	 Al0e+62xlYEVPFR6qq8kD27KF052YUzUgcvGe/pE84oRDGXDKiZwDdRRk5yngeKXfl
	 b9yOiZhC8LSDRmNB0JTLfU+hnx7fYxNBYe9tsZPinlJpmPyQ7pv3HmAAFh6aEL155Z
	 ps7r39EGoZj7GqA7VXVpkWyMa7RqBuB9wcUwkmHESkya/RYqh4mdNvfYpS/teFRN9R
	 YCvkYJNmJ90DQ==
From: Bjorn Andersson <andersson@kernel.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Amandeep Singh <quic_amansing@quicinc.com>
Cc: quic_devipriy@quicinc.com
Subject: Re: [PATCH] clk: qcom: ipq9574: Update the alpha PLL type for GPLLs
Date: Thu, 15 Aug 2024 15:40:34 -0500
Message-ID: <172375444828.1011236.17266535337835210110.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240806061105.2849944-1-quic_amansing@quicinc.com>
References: <20240806061105.2849944-1-quic_amansing@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 06 Aug 2024 11:41:05 +0530, Amandeep Singh wrote:
> Update PLL offsets to DEFAULT_EVO to configure MDIO to 800MHz.
> 
> The incorrect clock frequency leads to an incorrect MDIO clock. This,
> in turn, affects the MDIO hardware configurations as the divider is
> calculated from the MDIO clock frequency. If the clock frequency is
> not as expected, the MDIO register fails due to the generation of an
> incorrect MDIO frequency.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: ipq9574: Update the alpha PLL type for GPLLs
      commit: 6357efe3abead68048729adf11a9363881657939

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
