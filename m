Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C312B2EFDA6;
	Sun, 10 May 2026 10:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778408275; cv=none; b=JtG7pzNYT04M7S6DjvVd6fpK4+beIoiOwSW12pdLJWETj2FxAbXRRvoqGmc5md9vDoMkAbfmI4MxtQbL5mfqnkKG9+ga9938Nuwev8QjzQ9h6LBy5NnFXPm+OCAPPymqA0FB2ln+eWXpG6CX+/tGSxxboI7x2e1Vt2JeRwV1W7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778408275; c=relaxed/simple;
	bh=XZsDjQQPi2HUE3hC2AtJyS9EK9Buo3smRbbjHi0dDEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FA5gUjpQFKx1T5MnqMN6xkKxKlAcP3wtEj0FD9AKcWDaJkj4V2EgdRM9uSssKZxljcq0/4Vp3LDDAIdLbikj4XbPcVOL/vwwX0Ag7sKfLVQ1U+zSSAQ4f5RGPqZ8XfW9boM3w1zs5gcNv1M4yjY8GP6iZcCBk8ipbSacySS9AMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LjJ8fRZC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LjJ8fRZC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5861C2BCB8;
	Sun, 10 May 2026 10:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778408275;
	bh=XZsDjQQPi2HUE3hC2AtJyS9EK9Buo3smRbbjHi0dDEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LjJ8fRZC+0tDaifneY6OTi/OkJWVQHW4sAB6uK3/77U8k5jom7BIm3ilGlIoIeKax
	 qPfFfbxP/LUPY+ovj1zwpyJa+my8Fd/RnrHJMUQeygopBfQQBINBRSK7aL8ai2XBCp
	 PJ2CozH8xdYfzSUTgoisKi7BvM8szPT9ADlGyl2GIO5GTOkQS1djX0JjMvbekdwwfX
	 2jsA8zYB737XWnZtU7Lnc3Px9W2F5hekpu1tPHFvQ1fSXwNJnjSO8cIbGiacUVJKnh
	 KWO2djTc+sVdOhMoZBGdWdlQbq+rHQ3fVJwzKsyst0ACh346qNUdzXPLDHEdS4kpm0
	 eL2biA3i8i8ig==
Date: Sun, 10 May 2026 15:47:51 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 13/15] phy: mediatek: phy-mtk-hdmi-mt2701: use
 clk_determine_rate_noop()
Message-ID: <agBbT6YF0qXhizpQ@vaman>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
 <20260505-clk-determine-rate-noop-v3-13-f3f829fbacdf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505-clk-determine-rate-noop-v3-13-f3f829fbacdf@redhat.com>

On 05-05-26, 20:49, Brian Masney wrote:
> Drop the driver-specific empty determine_rate() function and use the new
> shared clk_determine_rate_noop() helper.

Acked-by: Vinod Koul <vkoul@kernel.org>


-- 
~Vinod
