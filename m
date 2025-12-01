Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A54301472;
	Mon,  1 Dec 2025 09:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764582159; cv=none; b=V3sdx+0+w/eW0PDJaF60hH00kfGwWpqfvp3t/bhONGdir2ByxYL69M3TsVoHzJ0Xxkqm+bBxfPldPsON0aPubl7CDF6dBPd0tF+8UMqOPLq7Lh2a7ooRgYTOPe9oxPL9C5XcRvaPa5oJkbFVPaIDPLla5jREZniNm4cNDKaOZNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764582159; c=relaxed/simple;
	bh=LZ3qbwSoacitpEU/K/W/T8rIHo1lENN5UOoNnCGaVR4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pn33wPQH2Eny2W8+aHOjsQCNfoz7ieNCmIXl3N2N4mQTj9itVi1YvM6Wmrhudbk2EyaHrXc6+bDJhXy1mQ18O40shEnq5IVLt5wu00khN05aI2oXeZP6oGCvgIdejTTGg7CVzPl64iM+XfkLr8XeELdAThhnqFLzkK++judKtZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 993B0C4CEF1;
	Mon,  1 Dec 2025 09:42:36 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Tero Kristo <t-kristo@ti.com>,
	Tony Lindgren <tony@atomide.com>,
	Keerthy <j-keerthy@ti.com>,
	Russ Dill <Russ.Dill@ti.com>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 0/3] clk: <linux/clk.h> fixes and improvements
Date: Mon,  1 Dec 2025 10:42:25 +0100
Message-ID: <cover.1764581744.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Russell, Stephen, Mike,

This patch series contains improvements for <linux/clk.h>.
The first patch fixes a bug reported by the kernel test robot.
The other patches improve readability.

Thanks for your comments!

Geert Uytterhoeven (3):
  clk: Move clk_{save,restore}_context() to COMMON_CLK section
  clk: Merge prepare and unprepare sections
  clk: Annotate #else and #endif

 include/linux/clk.h | 104 ++++++++++++++++++++++----------------------
 1 file changed, 52 insertions(+), 52 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
