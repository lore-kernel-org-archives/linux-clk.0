Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446E43890F8;
	Fri, 31 Jul 2026 03:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468303; cv=none; b=Afd767cxS/2YhGR8QBWDfItZdk6RozjgEoPIucOnEfMlnYNQ/4Tkw7FM6uEw12T9Mtlr7Y/YV3eSRi5xZp7z64wRqyk4uXQHTE6JiwPx7sUrvW9GzjQOZTi5Sdg2wGEnitV4EOhqD3HD8UtTbeVjFuGWsjt8lL/8cRUaRl92zgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468303; c=relaxed/simple;
	bh=yhtkPTeNYDs/5sGaalYwIv86a2hIjajAVIGzZQHpwmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dLcIWLHCRFSKZXAHvpW3C12fotJfDuPY82W7UMU5iatzwh7qXd8gQWZgdD3pT0VJa2DTD07lkO8qzZGXxxC3r+5H3PzQjJc2oq59SRlko9CXiXzlcFRaOxehqeUNJ8CzYxrM5R6RDFlcgpufXgKCTSV1nRm64FWva/cgJfiu8mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e63bdmzW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e63bdmzW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F4EF1F00A3A;
	Fri, 31 Jul 2026 03:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785468302;
	bh=fjN6zZsz8Z4eflNgi6KSFQep1nTH1VNNNxjgONUm8fY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e63bdmzWTJz2xcLuVWO46+vtVRhHlY0qY5tH5v1V2dEfNTn59gcSLfQsyeXiSDJ7B
	 jpKThxXmT55FaumOZWWaAMdkPg4YD2ifHBxBWOke/IOBVDqjabhPy50di7jR2Tz5bP
	 aynleu2jZmhKP35buEs0hXUqibdWaXwklTD2d1Xm9N0KYJZvoIHcJARr0bsrB1cNX7
	 b/aM2Z2N6VR3awp8w8TYRuvL0xdMjV1ao2xDVGNpF4FkmvTpcO1nDQDvBuhuowzYMV
	 tkromlca+arzSIRbmI+pXse6noAHZrUltkEbIC7ARJ5JhvudQskzs3Qs8ARluKStVX
	 MmIlvPeO0acFw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] clk: qcom: Drop inclusions of <linux/mod_devicetable.h>
Date: Thu, 30 Jul 2026 22:24:34 -0500
Message-ID: <178546826824.316815.1924718881037127202.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <7b6441aa3b0dba35112ea486bfea3b3171d8527b.1784225976.git.ukleinek@kernel.org>
References: <7b6441aa3b0dba35112ea486bfea3b3171d8527b.1784225976.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 16 Jul 2026 20:21:05 +0200, Uwe Kleine-König (The Capable Hub) wrote:
> The only used symbol in these four drivers that is provided by
> <linux/mod_devicetable.h> is of_device_id and this is also provided by
> <linux/platform_device.h>. So drop the unneeded include which brings us
> one step closer to removing <linux/mod_devicetable.h>.
> 
> 

Applied, thanks!

[1/1] clk: qcom: Drop inclusions of <linux/mod_devicetable.h>
      commit: 205986f9e81ddad510763f26e9ccdea0f49b3083

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
