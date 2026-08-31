Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DBD49502D;
	Mon, 31 Aug 2026 17:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198859; cv=none; b=A1FTEt8TS1wpQ8au9OPM5EDzYdaI0kI5oOHot0YCFzKxmy06TPie/blsTyOQtSCyi8gzUZfV1QRZet/sBgpPvrGlGTNm2d0AOorCB8716WLjsd84jviwrs1z4zBytrIveOu386TwRqVLDb1x2f2PnelnI5ih8iBA1VNhrPUKlsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198859; c=relaxed/simple;
	bh=D2XwsJwUWkH4ZsX70D5LEFPI8vRkCXM7yPBS3/nzISU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cm/1A0IvC8fJ7EPLgvK5N1AFpXUwiXEiw2ofHVYURfRL5/IkW3RQVCtNOe2mD/DM/hP9sCrh9IFjcVMkTFtTTtqnxxBUwJedmpH0gJHAUS+6n0lpya9qcP+CPnAg8C2sgDH8KpDJ3yT9ugM+aUdlJ44JOfwqF0fvhKtS/AohweE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G61CwDEJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G61CwDEJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9B3A1F00ADB;
	Mon, 31 Aug 2026 17:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788198857;
	bh=xzXeQ+KYmDl1STI9Wrb6xOHJ/Z+bbGwdO6kq02zCP7o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=G61CwDEJaBzlRY5E+CVaCXXK2uETcmu+MpwqWItdU9cH1wVdZL7ipBAXizuLePB1M
	 AGUtUYWMoB7HFrC9nQecZ7zGj6EY2rcdYUTrPg3wqE/0bDVA+3efNYsLmBBoP/clhy
	 kvwAyTbdHNGYeLppbVZcnlufCXX6SDpLVumaINEBG5up9NTUwigvLYONIKyskci5w/
	 L7gRMCxqNPmgwsAS9DxefolCn7W169REU6zlHegP2rz+JqjqxX4WKotqjyx3KHI5BK
	 ZcyEp9qViE0QEGk/y28iJ6rF25TRy28RZoLP4eC17fAOfFv1TMOtcbDs0mhkEM/rwT
	 6IEkq/g7ctSOg==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/4] clk: qcom: Migrate x1e80100 TCSR to clk_ref helper
Date: Mon, 31 Aug 2026 12:53:47 -0500
Message-ID: <178819882975.1411250.14880639483367583448.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827-hamoa_tcsr_qref_0826-v4-0-663c9d30468d@oss.qualcomm.com>
References: <20260827-hamoa_tcsr_qref_0826-v4-0-663c9d30468d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 27 Aug 2026 23:00:32 -0700, Qiang Yu wrote:
> The QREF block on X1E80100 supplies reference clocks to PCIe/USB/UFS
> PHYs and requires dedicated LDO supplies to operate. The digital
> control interface for QREF (clkref_en registers) resides in TCSR on
> X1E80100. This series migrates the x1e80100 TCSR driver to the common
> clkref_en helper introduced for Glymur/Mahua, and wires up the
> required regulator supplies.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: clock: qcom: Move x1e80100 TCSR to own binding
      commit: fcbd3151c9beffca044ea7a085d7e595ebf34f74
[2/4] clk: qcom: tcsrcc-x1e80100: Migrate to clk_ref helper
      commit: 011ed2a61f44b352bda71a82213f621bbfdb40f9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
