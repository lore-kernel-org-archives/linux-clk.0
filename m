Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FFE30D3E0
	for <linux-clk@vger.kernel.org>; Sat,  3 Oct 2026 15:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791041123; cv=none; b=qYUGRPPhHyBt2K3SjepLWw66qKe0x+RZdm2fdfqofoyuWFG1mIVGwEIjVInBXJjDEQg9PzqI+uQKZoVICgPRmtG057WEnWRL8PKyPZIONfOZY8gVJQOXVJap/OK2/qyMZKhfTC2Xcg1He2kP+bByaMMXrVlYFh3rt2jFPvRE7fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791041123; c=relaxed/simple;
	bh=KhkBWNuiusQT57tPTRPeg5zNcgHx9UFWFVoQpxKiMJk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cCcsUI4XCi0M0g3nA9sbJ7e6636IRrpcZYomxGmIpmis2k9ZzTNHno1QAy6DM87QqBUUDxdXkFd6MmLyqXIKbr8QMjisc6oHn/i8sZpphN1R5BRXSD1rntHE339y1HfNXQFNV6xTVG0DHJm6Mfi8keVOpKFC/PmmWme5gZ1Z4fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XJUp2+9T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XJUp2+9T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BED251F0089E;
	Sat,  3 Oct 2026 15:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791041122;
	bh=kyYsESqJs1RzwQhHHMRkPTPKvdniJodMlR3dH9oEz/8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XJUp2+9Tqlk4TNP3RVNnPIwzWwolmcT3BKGH1Eoy96F2Oe9bNwPFx2R1ST/lXpOma
	 MR+TEEWlACc43BraA2FSUXEIW/6Px3Uhi129sF2N05SluWKma2Y4SgWN+gpNUCcyVm
	 oi84C8hiS669+WIDvDKM3u8AJj/boBddD6I5bCkjFkMYVf1/td00zuhycERKL1rDVo
	 pc6u4gPX2CceGauBDEdIp/PMunjwzSECLED+zFEvTFBTbx2jN9AeJVw28YBMNmxkXr
	 pb3D3ds3c6Z3wubvJ+H9W8+bsQ6Eaz9NCCOCIY60RDHmRNhTVr9btQUZ8St9cyQHVN
	 KL6dnZBPXD4gg==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org
In-Reply-To: <cover.1787240165.git.geert+renesas@glider.be>
References: <cover.1787240165.git.geert+renesas@glider.be>
Subject: Re: [PATCH 0/2] phy: Make sure clk_init_data is fully initialized
Message-Id: <179104112038.223537.2313404929289351328.b4-ty@kernel.org>
Date: Sat, 03 Oct 2026 17:25:20 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 21 Aug 2026 12:08:38 +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> [...]

Applied, thanks!

[1/2] phy: freescale: fsl-samsung-hdmi: Make sure clk_init_data is fully initialized
      commit: fdc340bfc7ab60c4cbdb198c9972114b51d7caa3
[2/2] phy: rockchip: Make sure clk_init_data is fully initialized
      commit: 91967098fd985237ba0deff97809ab52d3e51fba

Best regards,
-- 
~Vinod


