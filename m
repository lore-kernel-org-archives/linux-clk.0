Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4529034C815;
	Thu, 26 Mar 2026 05:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774501480; cv=none; b=CahXJI2viSgRhdVv6ObE8/jxVWe99V7b4I9b4x5guEuVnFGzeTIq3uDvQgZfjXYyS8qj1LNnqUOpddXyZqm4lEESuWy7Tt4ARpHV+5vb9XthVGUMuPfiO2puI8I6sjVnFpVD+NIyatNAWcDQ2DlWwGrLNEPXN9yozBCvQAotr4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774501480; c=relaxed/simple;
	bh=/QrbQn0nEkvLTPCet5lN98pYVHK3PAEuFT41MD2TCUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lvjXV75HVsIG8dbUGh6sL8ogy3huo+ND1Hx7x6xE+tBzz+qH4046BKzfG6P/gBRu5zeLghQDiAWUoazzHI9KlhyPNbTe175L4XzV8Tf8IYgtypCd7K8+b3UdFLYSGaiwIqWDS3r3yHcBaJ0oHhlrv3POE0eXIQnhPu4FA41lync=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=YCFGlVVO; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YCFGlVVO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=mgtCYmqykJ8RqkpBA6kWebfP5yKwccUxqYKRl0JX98o=; b=YCFGlVVOFpxVpIE4JpNDSiTgqW
	J0NHpkW41zbcVhOouYMgKIczUwbGh45ZbCdW6bgPBtOynu8giHnZBy3PmPNWEtZ1SP3MZ2b8evDDW
	1Q1fC3ezXCnwQSZawGlrEuSkh0D64vaKBKoSb1BtsS/+Cyxz9ChrP45OMXOUqPvHkW6oGVQ90RltH
	DZoQmvrO8uyRNgF7byzWIG2o19KKrgYbK9AW8n4jhwOUdloEPjRRuCsZBkZYZ2IVf3O0pBQOEZIR/
	hWQ9bl1CERXd2oLEJ4vX/nTkWu+eWlDXVQulgIwM4CTrZQ2Hw7+Z4Hbj6nhYdhCHXtjcRwS0isYGr
	htMfXZjQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ctT-00000004hwq-2u7C;
	Thu, 26 Mar 2026 05:04:31 +0000
Message-ID: <1f5522c0-162b-4d26-9e65-2e4574971f04@infradead.org>
Date: Wed, 25 Mar 2026 22:04:31 -0700
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] clk: add kernel docs for struct clk_core
To: Brian Masney <bmasney@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260325-clk-docs-v2-0-bcf660e1ceb5@redhat.com>
 <20260325-clk-docs-v2-2-bcf660e1ceb5@redhat.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260325-clk-docs-v2-2-bcf660e1ceb5@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/25/26 4:52 PM, Brian Masney wrote:
> Document all of the members of struct clk_core.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/clk/clk.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

-- 
~Randy
