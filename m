Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EA723DE;
	Thu, 26 Dec 2024 16:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735230062; cv=none; b=VhRTi143HtqPArtb94bk5OhDZJeu3Cms+IVtFW6pCM8vpGOGdOINis6/AAIw3+sqjdLjVSjDTPIVl/PYQpGCmRoJKQTWvupo2PGAzWHiMviiV9J1pKLuWHHMXwAyEXrCVoW0xI1fiMoHWJ6eBgOpZHDCWzJlIGRYhLpHBzgzMvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735230062; c=relaxed/simple;
	bh=SqQcKYX5KnlIjymYXj3HhN92S1dQpKyuYeX4DMVPF8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P1CL6g5JFEI51/S4RlnZ+0WgfVPAFDcTUf/UptsrudSIjYaE/367yhkkZqCQDmtbsWjwaovRSehWz1Np3EgUJnf6uB5iM67Dk/26w2dnwyPiErEC/pwDMatvtfRW2gAN146ly9++WTXSRes4zXVO9ohXFX4BWW07j8XhbKQvP6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=ZyTVpYKl; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="ZyTVpYKl"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EDF19101ECB8B;
	Thu, 26 Dec 2024 17:20:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1735230058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SqQcKYX5KnlIjymYXj3HhN92S1dQpKyuYeX4DMVPF8s=;
	b=ZyTVpYKlnaEZEhuTYKzqnC//WmmywExIhmLfbv0/X7VGt4KcGn3uxsaeJi+z7CJ0DZrtfx
	zjBVHJzvnVv8VGf1Z0ebiKsTRv8edl7HsAamACDwM7GuXxAoiN7kGgfOu86aO6/BlXe6v6
	KuSZYKR0u3ySClLWnPMwSxigtCLByTFJdyA33smifG6iVOMG1jTDJZJ1xX1C3sYd0FJ6gc
	whb9VWUWz/w7JGYxiq1wimRA2cufLzDkvPewcxm/46E9ZtBEOXff05If67D3bBrwFILYNR
	5bXhS+H/g2cZWMFpWuv43NkQVX5qnhviTdKlthS/oUO0beohxZiAE83qKs09zA==
Message-ID: <1fea1252-04ef-40f1-95fa-41910f3c2e16@denx.de>
Date: Thu, 26 Dec 2024 17:20:55 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: fsl-sai: Add i.MX8M Mini support with 8 byte
 register offset
To: linux-clk@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Michael Walle
 <michael@walle.cc>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Rob Herring <robh@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20241226153155.36351-1-marex@denx.de>
 <20241226153155.36351-2-marex@denx.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241226153155.36351-2-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 12/26/24 4:30 PM, Marek Vasut wrote:
> The i.MX8M Mini/Nano/Plus variant of the SAI IP has control registers
> shifted by +8 bytes, add support for the i.MX8M Mini variant of the IP
> with this register shift.
Ugh, V2 with updated commit message is coming.
