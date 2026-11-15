Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794744592;
	b=FEKK2P1cidZbPgFtr5aTV8ttMcaeYlXpEBQ9GBohaCHRT/CeKKti6vNenTOhxWd8zN+n
	 QySdSaWh2HtpQhwZ/Yf5DGinYXQJcJaaHS1EZa1iSQzCqMo+La2NsBnQ8azn5o3J5u6wE
	 rfOwQgYBWc06LE6JPRMJo4rUDvXE6xMkICLxyDto7TbK5Mp65mE4sf+bYM4No3IWhYdlb
	 aoCLobrN4+Q4stbenmvk6vJ5ChkE6XWNU4lTh3N4Be5fkxweZnLmB3w/F882sYFyJVKQI
	 wtvdg0I9KYo/mPAP7OtuNq7jhFA8iY1p6JU4/qOQYMUn9+XH38bkXNC7fErBXhl+7eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794744592;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=b4p9wV2tpTy8te3nY3YNbgd551xiWngtyJF9zg8GUbI=;
	b=TF1BiVc6xa3FaGkJ6pJAxezPCSHjSQU4tiNTMCVkpITzmJg5yu71qAU5ukSzrDD6h7jx
	 2RVIoZUxs1hvs7q2Jql2elH35uD3myqWrFtf1KgpHQswpfE/M4uZhaZOqvp1RIoBgbnCC
	 H7oEyXW2rC2IaZNMFC99uWaWq1E7PjGiM5F7tOByvndtWMyCYX83Oy6satixa27MtmZy3
	 ORb81xKtCE19n+53XimiefZmwHYNyZ6Y+5DBymiQ8rOmm6kOa7bQ/GeJbYuqiY4CcYVAL
	 7b19szTSdNpQsIIO6z95ZqQ1XuKMLYFP2m69FuBciXn6IgFNoVpibfA1BsAqS3m2oxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kjQioaSI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47E8606A31A;
	Sun, 15 Nov 2026 12:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kjQioaSI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66F731F000C4;
	Sun, 15 Nov 2026 12:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794744592;
	bh=b4p9wV2tpTy8te3nY3YNbgd551xiWngtyJF9zg8GUbI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=kjQioaSIpqKriLrPr7CHHViM9z1V9W+JXYEgp/R4VvntcOwHi2zZLaxf1BI8JFVhQ
	 gu53ZmMEWBAogezb8DCRimozgXN8fyiYkdvz9JuuFA5a/ks2bh4FceKOFtNzGpqfrH
	 /6mQqdNbko4VpJtpDzX5XE+y3xDZ4kssbxFsxqyTIaaKHVPdSUVZG8uor+lur1zzXQ
	 7doWLP7VOu8a965Sd2nFww/c6d5cASvz99EDRgBCWbQ72c7txgQz4g61ytcVgrp11k
	 2f4d3ucSinmZAARo+zBaycMvE+BJkpLISrATCs21yp/bsCuydefsjzJwaFBMe15mTR
	 gJxwKhsm8dymg==
From: Chen-Yu Tsai <wens@kernel.org>
To: Samuel Holland <samuel@sholland.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, bmasney+clk@redhat.com, 
 jbrunet+clk@baylibre.com, sboyd@kernel.org, 
 Andre Przywara <andre.przywara@arm.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org
In-Reply-To: <20261115061102.229680-1-jernej.skrabec@gmail.com>
References: <20261115061102.229680-1-jernej.skrabec@gmail.com>
Subject: Re: (subset) [PATCH v3 0/8] drm/sun4i: update DE33 support
Message-Id: <179474458919.3130971.11295267069000925576.b4-ty@kernel.org>
Date: Sun, 15 Nov 2026 20:09:49 +0800
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
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Sun, 15 Nov 2026 07:10:54 +0100, Jernej Skrabec wrote:
> This is second series out of tree which aims at properly introducing
> support for H616 Display Engine 3.3. Previous series [1] reorganized
> driver so proper DE33 support can be easily implemented.
> 
> H616 DE33 support was actually introduced a while back, but it was done
> without fully understanding hardware design. Issue with existing binding
> is that it considers planes as resource which is hardwired to each mixer
> as it was done on older Display Engine generations (DE3 and lower). That
> is not the case anymore. This series introduces new driver for planes
> management, which allows doing proper plane assignments.
> 
> [...]

Applied to sunxi/clk-for-7.5 in sunxi, thanks!

[1/8] clk: sunxi-ng: de2: Fix Display Engine 3.3 definitions
      https://git.kernel.org/sunxi/linux/c/c6d21e8bb03e
[2/8] clk: sunxi-ng: de2: Export register regmap for DE33
      https://git.kernel.org/sunxi/linux/c/63a29fbb4ecd

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

