Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0219C4E431B;
	Fri, 25 Sep 2026 16:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354644; cv=none; b=MqpQOkh9xJON2wZANRLyYCpchvBle5Y+1F3IjhaMLXdXnv1OWeHb3OC9+rjsmstVvNYjAb/vX7vM4yik6Vosqu11jM3VOJ01/UCXiQDWdUqpaYuDlpWPFqwHtiHhxHtpgImPaW4iPwfqW8wm1ILTQpe1GSlrZumUGeBOgVxabuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354644; c=relaxed/simple;
	bh=Y18Xv/GwjRVC35rQPgqpVu2jSo12KHhUY3AnOcvR51k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oHVatJdi24lMmaUSa7fAl9BcaKCKhx6JCi8X4qOBgSf9lvsCzMJYwvzP2WPgrlZA2ZTkJ5xFsPgswSoPUpRfFxi+AvXgm6a7V214/NibiDUsOsUwW5pzrp5JctqeulqyBBgI0vsHlvkHPQZZnl7CQm2KHBiJ2hEvNSU6fJ+pKKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dV3DgeSe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dV3DgeSe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D2AA1F00899;
	Fri, 25 Sep 2026 16:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790354622;
	bh=Zh96Yu6giJbBwotlMOfaSYWNC+R3pzXsgVPTxESMdhs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dV3DgeSexmHQcGfqrJZJqQ0VUA8slSrY3/TEZZ16DW1TwPfIhfWb7rUQSHwhSdIGF
	 CY5YvJA/q7O40UQZLI8G9HJjk0r8XUWUaNtVk1eFV5+6SE8/Y+bFXorzSPYv8vHaAV
	 YR68IKixNB955KPiDu2PsvrIBTQHaRM5MBQzcLFXGxj0APxY65JpWNiDxCXF5i6go5
	 o2vN+Bfby9j9iZE6o8EeweF1X67aME7zjqplMS0wY8Gz4XIpxz9kCTKdKOprKPl8GT
	 DOpjOsejvyS0jTj/1X8EsRQ/b3WXa5fAUwEXMEWwdSX81KE6rvpxZGoaZwpJ+E0Vbq
	 IcF1kWYuE/R9Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: mmcc-msm8996: Fix FD AHB clock register offset
Date: Fri, 25 Sep 2026 11:43:21 -0500
Message-ID: <179035461243.1296652.10391771173052579741.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916-clk-qcom-mmcc-msm8996-fix-fd-ahb-offset-v1-1-a575e1b9112c@oss.qualcomm.com>
References: <20260916-clk-qcom-mmcc-msm8996-fix-fd-ahb-offset-v1-1-a575e1b9112c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 16 Sep 2026 14:45:53 +0300, Abel Vesa wrote:
> The FD AHB clock branch register is at offset 0x3b74, not 0x3ba74.
> The incorrect offset exceeds the regmap maximum of 0xb008, so regmap
> rejects accesses to it and the clock cannot be enabled.
> 
> Correct both the enable and halt register offsets so the driver can
> enable the branch and check its status.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: mmcc-msm8996: Fix FD AHB clock register offset
      commit: 3c8abc5a814a0349912d59a91ed7c459475758ce

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
