Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B11D1B2196
	for <linux-clk@vger.kernel.org>; Thu, 14 Nov 2024 22:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731623932; cv=none; b=VT2bXdRifuBX3LmqnUcWv3muT7Noz29ATH0Ua4+HRzoT8W1cnsveGAAgiozMyz7AiX7T6K5TTgSgoK8eVwSMV/9i/HvURGhlPhT8//3vbUadoALk1tCMgFPUf7y7UL0yITn2KdnAV0rCsFu2uC9tqIu4pkcxB9ro5+ZSapiyuNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731623932; c=relaxed/simple;
	bh=jQWDXG3wMZIdSrsC7JDfk+oX20Ytl66lahMoDYosAS8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lBBhqbgZtb5M6Kb4+7BWTHiAVOO5CMYhrtar613gNX+aynQ9h9Usrt1J0jfhZ7kONeM6ZmJddAflybaehRXNtgZ4jIlkW65w507V7tGjovSArzqEWIMcJJPoP72tnoY1fXIJU8bRtB0L5EgA5kox+rmljqJuPyHQfvlhH8E6yKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=0IgtVFVT; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="0IgtVFVT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=D1XsaCqkWwRR6XrSHEGg6TIaTIM6VeYXYn+FOkXw2fo=; b=0IgtVFVTHwai0AsNOcCKn+UeX+
	sLf41k6IavnOXl6Wv4PLk/LOxR0K7BoFeJ1Fl1+rGmNJQoi6XmYEpiua3zNrNi+XDm6kqrjzpkuH5
	rC3bzvyHrOXPx6EDJYeB8A1zOOCN2OlE3ml3DOIzkPROH8jwnWXATxiYZEc8Vt+xQCZykqOnnsqaI
	BmkUHw7nDL8sWoSpEVG/NjruAZ3Jbkj2Fp0PMKPc0IVHTjIXB5aFfhG5B9kHoSGAJVIZ+dS+6ehG3
	vimO7+9Ql8j1KCHsfuAvAC5s3i1lSsmnEqlNsewiWglcOmnH6BXaQgcwnB9dDIaDsrG+scOiAAtze
	c+uYY/7Q==;
Received: from i53875a30.versanet.de ([83.135.90.48] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tBiU0-0006Ij-KJ; Thu, 14 Nov 2024 23:38:36 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock changes for 6.13 #1
Date: Thu, 14 Nov 2024 23:38:35 +0100
Message-ID: <3061836.mvXUDI8C0e@phil>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Mike, Stephen,

please find below a pull-request with one Rockchip clock change for 6.13

Please pull.

Thanks
Heiko


The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.13-rockchip-clk1

for you to fetch changes up to 5011cc7ad9aeea98029385f8a0e81a0ebfc45bed:

  dt-bindings: clock: convert rockchip,rk3328-cru.txt to YAML (2024-10-08 21:11:29 +0200)

----------------------------------------------------------------
YAML conversion of the rk3328 clock controller binding.

----------------------------------------------------------------
Johan Jonker (1):
      dt-bindings: clock: convert rockchip,rk3328-cru.txt to YAML

 .../bindings/clock/rockchip,rk3328-cru.txt         | 58 -----------------
 .../bindings/clock/rockchip,rk3328-cru.yaml        | 74 ++++++++++++++++++++++
 2 files changed, 74 insertions(+), 58 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3328-cru.txt
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3328-cru.yaml



