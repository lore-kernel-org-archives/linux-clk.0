Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38B3282F29;
	Wed, 11 Mar 2026 15:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773243392; cv=none; b=Rg+1Xs3QWz9jtbC9Zik3OTBoxgJbrejXVuovjtTKqWXdk/3CcuU+34SpBziU+Q8sKgogJelVpejeacFfi7r9LxNzpTu6S8YVrNYDOcazb5H5e7iYH3zI2OHBjEClFZrnUV+KbMEHcsTPTfqmV3/8HH/diZ27FXs/dYgS1YAeP/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773243392; c=relaxed/simple;
	bh=JU81ngG/QD2/DdGE4t9EFaLgUSkfx/1x3FALX2tPOmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XxMmw6+5GzCAIeKiQjOWkL8gB17O2u8suv0pgTO7K7n6+kFNd6pQoYs1rxX2LJMVMWdN52FRCmUUseNhv25zsQXhrB1jGwSi6fEF9pTML3pJcuh+ZmoOEJD1LarEqv+5TqUmIGUX+h6t+uLZ/xtp76Yfil1iMuvL+ly63ROJ3KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hW1dSVPn; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hW1dSVPn"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fWFGK6Ptgz9tjp;
	Wed, 11 Mar 2026 16:36:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773243386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dvu4bOl1HAw2CbBdsUzLZ35Lks5obRihjJ/HUy2GJa0=;
	b=hW1dSVPnW+V1aKqdDGDGXxlPkZmbcT1pywBiapFuhjBk+Myr6ITo7iWYfNsKWcr0CioaDr
	mdnmIvKw+N5Sw0yC6cUbkT//jE6Supe6s7yqczpgT/YeLDf10wKi7qfVLhP72TOa8hXTIR
	kvUKAD0NfKsXssove/9o1TTi5jiAPsnmhlOKPdVtm1bBEa3MoC6euL1c48gdJThWOwyW/D
	3r3qP1kuh+vG3tZlD6BDE+5FwCWScgY6Rys0ix44Ex3YS1rL9j2cUcqFkv8GcrxaKXuv6D
	LhxgjzklWTedCUsJBjwjilPIk8qeiUInUEjy8t+aSJx4Ar3LWk6Jw9WYViXNlw==
Message-ID: <1ca77005-f14d-4754-9f78-7598f75a940c@mailbox.org>
Date: Wed, 11 Mar 2026 16:36:23 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 1/2] clk: rs9: Add clock index range check to
 rs9_of_clk_get()
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1773241119.git.geert+renesas@glider.be>
 <9b4e40b1d543e11bfdf229a6a8af1b836f79df16.1773241119.git.geert+renesas@glider.be>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <9b4e40b1d543e11bfdf229a6a8af1b836f79df16.1773241119.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: hr56umzhrya71dry7txd5t714su8yt5k
X-MBO-RS-ID: 1c469b7c85f343ce7a5

On 3/11/26 4:06 PM, Geert Uytterhoeven wrote:
> rs9_of_clk_get() does not validate the clock index in the passed
> DT clock specifier.  If DT specifies an incorrect and out-of-range
> index, this will access memory beyond the end of the clk_dif[] array.
> 
> Fix by this adding a range check to rs9_of_clk_get().
> 
> Fixes: 892e0ddea1aa6f70 ("clk: rs9: Add Renesas 9-series PCIe clock generator driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
