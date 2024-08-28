Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FE113775E;
	Wed, 28 Aug 2024 20:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724876049; cv=none; b=EwgrNpEb1wLLWzyf4YqK1xKq68X91XRSvOIqNXsCELac/uI8nI14DNKZuKDJslQOiPuLck10KonMQorkC0Ei0L536B7rk2+gsxgurRe24yoYCvO5YZP35hOU/+TxMt0ZN1OEVti9VCDWsNDhVi5jWecc7q3UXU0fBs5ic3ZlGyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724876049; c=relaxed/simple;
	bh=zeoMx7G9IwglFmLfO/ggohfxddakIVsr7ky4bn4EDn4=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=JGlyTxJ5GNVQQYwZ+akZzQVq+t+IhTd3AEHq2L+T1w6mpL5VrgQkc8eUB4TSeiC9ipLRgR0wEChQirFahehL3o3iAmYQkBqWm0v/prGDMfWHSWhu/kwDwj/mEOtnau5SvHRfQ0gOd4GgnnXddOLD8C/KFPkHM0pSOcG340tXqIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jgjbIeof; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jgjbIeof"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF2DBC4CEC0;
	Wed, 28 Aug 2024 20:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724876048;
	bh=zeoMx7G9IwglFmLfO/ggohfxddakIVsr7ky4bn4EDn4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=jgjbIeof63XET8Zc14F5wWVPw4YUGbXlnsCxd2j3ImMFkGsNGIvy6Zg95xJKbM5gF
	 neOScMnAV9K5tBL/dXBNZSaZk34leYYyoICgz0F7UbWZpgWww3/x6lz98qbc9+VkBA
	 0Bp8Z9rZJqWBOG/t5tdCFjfoGJtGYi8trpBysvjZ3XAQhgXGqc/bfSo9d1fdOKJf97
	 7IZAL3b9e9XC1s7YF6rbCiTe8930YMIrr82KmzAlZlBoLD+aYpxvD8NhEWqn47QEvC
	 EG9tKKFDj7FETQFI+rUXQ80m4aUO3bJ5fByFAf2dmGrhCSFWL65UMMDBoPdjtcB2cZ
	 in66ODjeZCz2Q==
Message-ID: <ecbf474e654f80f91f69b5b238425f8f.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240828073515.950677-1-liyuesong@vivo.com>
References: <20240828073515.950677-1-liyuesong@vivo.com>
Subject: Re: [PATCH v1] clk:davinci: make use of dev_err_cast_probe()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, opensource.kernel@vivo.com, Yuesong Li <liyuesong@vivo.com>
To: Yuesong Li <liyuesong@vivo.com>, david@lechnology.com, mturquette@baylibre.com
Date: Wed, 28 Aug 2024 13:14:06 -0700
User-Agent: alot/0.10

Quoting Yuesong Li (2024-08-28 00:35:15)
> Using dev_err_cast_probe() to simplify the code.
>=20
> Signed-off-by: Yuesong Li <liyuesong@vivo.com>
> ---

Applied to clk-next
