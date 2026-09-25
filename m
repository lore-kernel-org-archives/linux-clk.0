Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B453E3C5F
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 10:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790333957; cv=none; b=CLHb/BXO6fYsdWpvXJCNq6f+mjnKB4yNcXC6GsHJqNshBekJJJYVpbrhqgKTKrhFgz4QXt2yTyj5EBlJ3uYWbbJR9ES2+co4j81NkYKUh0++XMZZDCkRghWsXkJDELF8WknyPdPlK647GX8JrVIEho++qdGdQpbPNCFxW76Iskw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790333957; c=relaxed/simple;
	bh=9E8SYctwoKIWIDrX6xzHqoLAw42G6kcjht1Nk5VFEFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WieGMwXnUnstkYIge+RQ574Qu15lXpyYou7vxIOvBySVqsh2Lt7KNVI06ABpBO/STQRZUs4KyNFvrxFU+H49sbemW5V9mgynqBM03STFbIj9SongAlkBpOsQA0ERBto9Fj2agLG5+jlH8riHNXGnldQ8YjNMraN06o8PWVt8RuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZYIBx4IU; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZYIBx4IU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=LuDn
	1QhKbYkZ1hXxGTYyZQTLZXU2xrn93NrCq2PF99c=; b=ZYIBx4IUUt2QBLx6dGtr
	aNTF6wWfAlVR9RpRxUk7Pibbty9NWHR9x5j5jWTnIEt/E1Vvt3jUklO1kHCk+lqe
	C+tJzsmYlm94F1A9GqCy/41wXlHbCZmOf3kGMbbmMmFIVjQYgKVbr7LywcoP+wPH
	pyTKvMRcijcvlkMtbBCKeLG+W/NeK48teYpNiIeyFmqXoh5wZF5Gdw4xGMiQ9rZg
	OS/zG3Y6K/IHriTDXIY7yIhbasIDCQu5e8dZphMzVehV9WiQiF/GS4+dVz7K5Ocu
	zh9HN6hrmOozbu6c5+VLFy9F3mXFmB0Hh71zvnfS8z8VR+4i3mFQT19OElPlt9b1
	7w==
Received: (qmail 1529788 invoked from network); 25 Sep 2026 12:59:11 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2026 12:59:11 +0200
X-UD-Smtp-Session: l3s3148p1@eVszm0xcQKMujnvn
Date: Fri, 25 Sep 2026 12:59:11 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: r8a78000: Add SGASYNCD8_PERW_BUS
Message-ID: <arZT_2p0MXMgAUIU@shikoro>
References: <8c4912ada9c3d6776ae64d3896ffc1f45a98c51a.1790326477.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c4912ada9c3d6776ae64d3896ffc1f45a98c51a.1790326477.git.geert+renesas@glider.be>

On Fri, Sep 25, 2026 at 10:56:14AM +0200, Geert Uytterhoeven wrote:
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> Add support for the SGASYNCD8_PERW_BUS clock, which is a fixed 133 MHz
> clock serving as the functional clock parent for I2C cores 1 to 8.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for constant forward-porting this patch to your latest base
work!

