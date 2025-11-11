Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866463446DF
	for <linux-clk@vger.kernel.org>; Tue, 11 Nov 2025 03:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762832345; cv=none; b=ZRf7Tt2r8hh7TPrDGbCe4S9lxtn4qJZLB5hdq3EYo4u/Zn6oj/Jndv4EQlYp8VBwpEPMRqwy4zMNalzJsu0DefnzkAMS0gVGH//3QrpmyEYmlmWl28etYyWzWnipvTZ1Hyv4HC/4Luu8bI6wVFcT+sIOmcZ8PtVEh2PYM74Ln/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762832345; c=relaxed/simple;
	bh=gqOCwtPQTZk3jpEdvZKI2Jr/kO5EH71V9WA5lAbRAuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cx8Pjxcb1MvXPdLdgtJn/58JUsD0wGO1W5HT6O+OUSKKjUTK5vSy/h/5sLvvngrbj+7nwUj6tsDPgK2qbkm7enLkXlIZZp+GuOStJBX9FZPOUFeFgDpoc4eCHOYwTe9Z5qlzELivYVBiDzmMRUV5b00i7Z7Ldp1qJ2kZYA63180=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iUGFXxSv; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iUGFXxSv"
Date: Tue, 11 Nov 2025 11:38:40 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1762832331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ksG87ws8ce649q0qBeX08n/5lShn7Ts8Rh+qqZIQlp4=;
	b=iUGFXxSvrGhyXJ0fgGLbylsJnJG9VaprjBi/297+63xAZqLtvM1oVmxkUHFZgv85Dw5LCy
	NBENUVQcAo6G7lrseU9rT0S/ZNi/BH5LtWCQT4w5WkkmkAxdy4pdIypJAqPrKPR+6/XVZp
	bJNPzjlOLF49UIltRIC5ZTD6ok2FS1w=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Troy Mitchell <troy.mitchell@linux.dev>
To: Xuyang Dong <dongxuyang@eswincomputing.com>,
	Troy Mitchell <troy.mitchell@linux.dev>, mturquette@baylibre.com,
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, bmasney@redhat.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
	huangyifeng@eswincomputing.com, pinkesh.vaghela@einfochips.com
Subject: Re: Re: [PATCH v7 2/2] clock: eswin: Add eic7700 clock driver
Message-ID: <aRKvwL-puEquiIOh@kernel.org>
References: <20251023071658.455-1-dongxuyang@eswincomputing.com>
 <20251023071814.568-1-dongxuyang@eswincomputing.com>
 <aQ2jbf2k3rwOZDuB@kernel.org>
 <74be57c4.45.19a7080fca1.Coremail.dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <74be57c4.45.19a7080fca1.Coremail.dongxuyang@eswincomputing.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Nov 11, 2025 at 09:21:32AM +0800, Xuyang Dong wrote:
> Hi Troy,
> 
> The link [1] provides the official documentation for the EIC7700. 
> Section 3.2 covers the clock subsystem, where you can find detailed 
> information about the clock-tree.
Much clearer now. I suggest putting this link directly in the cover-letter
in the next version.
> 
> [1] https://www.sifive.com/document-file/eic7700x-datasheet
Thanks for your link.

                                  - Troy
> 
> Regards,
> Xuyang Dong
