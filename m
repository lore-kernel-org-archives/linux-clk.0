Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4C930498E
	for <linux-clk@vger.kernel.org>; Tue, 10 Feb 2026 19:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770752253; cv=none; b=gklJbU3IXCtKVDHBRbVOyN6Uj02SUE5UukfSY/cCPBfstx7Un6VQcyGh7miH5ZLuTU+qYp1Qz0sfbaVXGR2PUqZBd4Fi8eKDB//bD/SM7MRR0EBbvx+naaG2XfyjWlvUVRgzIemvUjeyjnLGWaDbhVIQtAp6tFbMJiYW2bbBc8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770752253; c=relaxed/simple;
	bh=fRur79AaHqNQV3fBr4hf5Rrc3u8CGGPgcbZLe1PvlTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mY0sMlZrwo/lWKEDJ2qTYM//GFCq9/w/Tyqhxzj4qCCgdoF7QvKqEKKXMofz9taCsXKitJ/r+GOc7FfndyaUxzN7CNBgdOavUQs0dzkb9rJsnrVWUTZRf+sUfwqpB741Yju0qt/ixLxnOsQukulUiPHjqUFsOhNms4NYDjaWpOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R5fefDvU; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R5fefDvU"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-436333dcc42so449369f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 10 Feb 2026 11:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770752250; x=1771357050; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fqDz8Drx8XjDtZc8LsAC+uLDhKgLLYdxTPVtiF/ij7I=;
        b=R5fefDvUd00un7dIomu5/1O1/MvCC9JM8X4upAFz60c/ub91qrSPIuetKpbXV8gIqi
         YFQIyDLbTcJi+H4iRKR98ib6Wi6unP8GBW2b0tXYrRr5GwVkJcLlqUfhi2p/ot3Qv61t
         vurZ0WJYck/zenfGJSe0krk0uxKaQ4n9EfvIbRZYhbS6Ij42Bx47J/YbkWKXHOqvpyIq
         UzCkfipCNL7e2mC6H4SRCiOWeuDoaSnAqpvZzDrXKQpwh7H+d/ZQQ57ImxsLihOgZw/D
         ZxsJRacQL7ZMjkUamPG8ethuix9QCUOVfa/mWYeTh/25mymB0VRVXzFhZWaZznQmPEbC
         un8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770752250; x=1771357050;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fqDz8Drx8XjDtZc8LsAC+uLDhKgLLYdxTPVtiF/ij7I=;
        b=NwMpXBhx+/+77znBf99lr6Y8vjvzdCLE+y7orNFfE2i6MCweRwygmZSbF0FvA+AsPr
         DHRF+BeV672h1JPpLofdJ8cve3U5ErwAdmtax5PK1p1gE1jXp4Ryh/dYe6P+1YThaLCw
         w6Zfval4OTj0xA1j5q23jFFFD4rHwTfOcorGDEItlD/+qMc0s9fTU6VSAc2QpQcSBVCA
         n5ONTBob+13CMMhRf55pU9tt5mwq5uey27Vdew9k2eHxT1ZcoancEDT+UF73dAS6pr7W
         sfefh/2dVWshJ19NwkfDiLbgxsssx2vFFdja9vV3mY+AQml1/gjOtoOxqG3GVF1yXJl+
         c/7g==
X-Forwarded-Encrypted: i=1; AJvYcCWd3V66hZBTB3vfhwe3ze46khz6kfZS8+bezLxdpjlxMj03E1F7rzBSpQOQWaUoyVXALl+1+Z679DM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv5k3unGgbDSh9X393xLI2mKR+9pWYXSHvB86hCLdkorw0ReFe
	f0Y5tXQ7RhblSR5cWnHBmlGgA1sdCJ8wUCH0Oeeu2G3v7hbMxHiCPgan
X-Gm-Gg: AZuq6aIgKCsivTIKIwoIpiBnEU97ipQXDwJJVfAvlube5jmR9HYhPZemDLp84iK3XAg
	yKnSXXsRDDibKJQRiZMZmx51nk3LZZxurUgmbnFCsR2BU1PE7DuONfudYFNqlez6Ngxl1EupHpF
	8QT7bqrUhhIyi8MpbnfxsjeD2EerYhN9OSgcM/degpbvK42V71XsWNtHwHJsVbNq5UBixdXLVJt
	sMixmdinxMRb9b8uI7vHRZ9hMlgh2sZ0ZJ5uHnXIAR2lR30pI4fiPSrL0E8CVsmIC+pDI+vZJQK
	T7gktRPCrU5izFbOdDc7hRIAWUYk6OAo8IwAl8KQ7SoTbrSR5h3u8lkStHJcm7wrud4yatrUutc
	T6TLS1t63xDk0GsNKujWbqiCfP1DwPuPo7CmEDWQfwi+7yCn8Lxgem8jiWs0YYTcZEmYlDnIMXR
	I9AA1k8CyaKho31YQ=
X-Received: by 2002:a05:6000:3104:b0:437:771e:9dbd with SMTP id ffacd0b85a97d-4377aba5bd2mr2497517f8f.0.1770752250206;
        Tue, 10 Feb 2026 11:37:30 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:d8ac:c964:9b43:1b13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd4a1sm36328520f8f.17.2026.02.10.11.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 11:37:29 -0800 (PST)
Date: Tue, 10 Feb 2026 21:37:26 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: =?utf-8?Q?Gr=C3=A9gory?= Clement <gregory.clement@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org,
	=?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v6 2/8] phy: sort Kconfig and Makefile
Message-ID: <20260210193726.h6fc65gekida65la@skbuf>
References: <20260127-macb-phy-v6-0-cdd840588188@bootlin.com>
 <20260127-macb-phy-v6-2-cdd840588188@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260127-macb-phy-v6-2-cdd840588188@bootlin.com>

Hi Theo,

On Tue, Jan 27, 2026 at 06:09:30PM +0100, Théo Lebrun wrote:
> Neither Kconfig nor Makefile are sorted; reorder them.
> 
> $ diff -U100 <(grep ^config drivers/phy/Kconfig) \
>              <(grep ^config drivers/phy/Kconfig | sort)
> 
> $ diff -U100 <(grep ^obj-\\$ drivers/phy/Makefile) \
>              <(grep ^obj-\\$ drivers/phy/Makefile | sort)
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---

This patch is appreciated, however it no longer applies on top of
current linux-phy/next.

Since we are in the merge window currently, would you mind reposting in
2 weeks (or as RFC in the meantime)?
