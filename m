Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169358;
	b=o/96FdLFgnOGMi8UIqvSr+ERpTiaFXbseBLqtrJhG+v1alg0bIofILtHJ5cgvwz4l0yV
	 p3UVie5/54mRizCVlXyZjEA3olIRsXdw4shS31KPafpvYwzABwjdOCpA/AcITL1IcTO/o
	 GKOY2zcDK4G9k4Cl+6MoROUQvGtEDn25AtkqlzQ79vwvgkv1Cs7FbCIZ1ccutmY1BBgaO
	 zflu5QrsFEUE15fYxwh7tyCs875Y/X8Eit9SXioZHKom6/COhoHHXb9SeKhOSJtGGWs+B
	 cbVcnZGFou6gzV4MG0dYgO5K5jD5GgGqSFjmzawSFtVU5cs/m6puiDS3b/kLfKvXv6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169358;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=J59kU0NVCcqYcr4shnDVtEhKulCk9RJGDvqLm+9RUSc=;
	b=nFxjMEr0NzGmui+3CDmtIjE4NGdbD02UTLT+XXCnCoXu0CflkAY1AdmKpCLfny6bhsIx
	 7ZQczBLW8e/vdWtsYSVEz8VQzXCdrlqu/I6U83q0Q/k1GWYkyJTs8DxTrX7s3cB5oFIWW
	 rADykfoVBZ8LedXsEvY9X0+J4o61YwOjVLqMFd0z+IWj8T29h1piy0FQYqtaSSz1rRQGC
	 Wv+XiRm3M6DfTOZjNvE8/3wSwtxlTtZlUYqw6znb4qnMucdyt6pavL0+N5lxP6MRApn1n
	 2Na+ZHJJ7MKmv1rYJHdMs8t+Apn1bKrIGEGpmvuzSZlKuFImc3n6Z9wZnkfAJ6H39nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N4KPBTtw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F00F606A9C7;
	Sun,  8 Nov 2026 20:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N4KPBTtw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 664191F008A4;
	Sun,  8 Nov 2026 20:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169358;
	bh=J59kU0NVCcqYcr4shnDVtEhKulCk9RJGDvqLm+9RUSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=N4KPBTtwxdfeO33j0snI3WixpQ5qj7i1AjR2HH6MslKeNXDaucOkegW4TbWpDMQkn
	 babnYxm5I6dLY5mNfHI3TJFS37P1Z3btryQ41YvrOe3WTNqVA8rdzj9W1GyJ3tFsFA
	 0Cm9NxVRiGVR1AvvXYqRQKYxABi9GTfCcDXyU/uJWloXThmgfpo/2Tw1Vecopulwr0
	 sgtSvPUNEK69y49unFFvYE8SDY6nX1czaHwEsSQmU7+egn84BwMJI+cdvq4nAyYTW2
	 wggxbV4Nem5+IYPx+PEY1mMs1NcoqDc4OPxvJcQlzbDfmoWPzUxi8Mu0osrAJ/QZDR
	 W4pI07n1I46Pg==
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Martin Botka <martin.botka@somainline.org>,
	Fabricio Akio <fabricioakio@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: mmcc-sdm660: Do not keep the video core clock always on
Date: Sun,  8 Nov 2026 14:19:43 -0600
Message-ID: <179416929337.628393.6548300714899601564.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261008-mmcc-sdm660-video-core-v1-1-3a772ad6a436@gmail.com>
References: <20261008-mmcc-sdm660-video-core-v1-1-3a772ad6a436@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 08 Oct 2026 18:49:18 -0300, Fabricio Akio wrote:
> video_core_clk_src is marked CLK_IS_CRITICAL, so it is kept prepared and
> enabled from boot, and with it its parent XO, which the RPM then can
> never shut down. Nothing records why: the clock only feeds the video
> codec, whose driver enables the core clock it needs, and the same clock
> is not critical on MSM8996 or MSM8998.
> 
> Drop the flag.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: mmcc-sdm660: Do not keep the video core clock always on
      commit: 72ce3d44229962bfd63fbfe8765d83f7a22906ed

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
