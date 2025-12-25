Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEB62236E0;
	Thu, 25 Dec 2025 02:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766629359; cv=none; b=haKK9vDhyOSDXvXIUkTYoGb25mmzTeyJpvWmy3dqXNeE3EsPd30RnGTPdCKZSqojWWmj3O33FZtb1TGeJ2lz/6rxESsmkuFL0rgncO/eJfAxtUu3po8YlLLut4jNwdnYq/nxXJvhjo7ehcMz2ftIU+aO5JxCrzDEKBe2n2bls20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766629359; c=relaxed/simple;
	bh=j90WaRFwhzrnXfMTTC3vaWpis6v50jLev126IuRr+Jw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qBkB0RYDBCQHCdAx7kmzil+soj/IPIsZcA2wRB6emx5qOhpz98bnR6Uns/f2tRTKdYANaJA+95rWyEjqx/F4RGqWApONpRpvGblb7qyUcAAv0znQHGa5TaxeZWWUI5AQS/1hGb3nVMxO4KWRz9Ewv4+eaGCjkqYZyCebMgHWlRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from ofsar (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 33C4A341030;
	Thu, 25 Dec 2025 02:22:32 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Haylen Chu <heylenay@4d2.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Charles Mirabile <cmirabil@redhat.com>,
	Brian Masney <bmasney@redhat.com>,
	Akhilesh Patil <akhilesh@ee.iitb.ac.in>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 0/2] clk: spacemit: Fix module build for spacemit common ccu driver
Date: Thu, 25 Dec 2025 10:22:25 +0800
Message-ID: <176662919110.361686.13875991021272017337.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219012819.440972-1-inochiama@gmail.com>
References: <20251219012819.440972-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 19 Dec 2025 09:28:16 +0800, Inochi Amaoto wrote:
> Currently, the SPACEMIT_CCU entry is only a switch for enabling entry
> SPACEMIT_K1_CCU. It does not guide the build for common clock codes
> even if it is a tristate entry. This makes this entry useless.
> 
> Change the Makefile to add a separate build for common clock logic,
> so the SPACEMIT_CCU entry takes effect, also add necessary
> MODULE_LICENSE()/MODULE_DESCRIPTION()/EXPORT_SYMBOL() for the module
> build.
> 
> [...]

Applied, thanks!

[1/2] clk: spacemit: Respect Kconfig setting when building modules
      https://github.com/spacemit-com/linux/commit/5ec8cbbc54c82c0bdae4dbf0e5aecf9817bde2b9
[2/2] clk: spacemit: Hide common clock driver from user controller
      https://github.com/spacemit-com/linux/commit/99735a742f7e9a3e7f4cb6c58edf1b38101e7657

Best regards,
-- 
Yixun Lan

