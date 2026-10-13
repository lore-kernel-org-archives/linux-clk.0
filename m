Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DAB53F6AC;
	Tue, 13 Oct 2026 15:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791905906; cv=pass; b=CXImodyTHjJqSzxZFH6a+7q+7SWOPCMI3rS8ZU8yb+l6xUj6kYqxsdNsjqYhY/59DaNCPEGyBsuyephWydBteoIrwkiU4gwUghOGAoRyGM50agkx5oMcYcn/VZDFwGrXqr03mRfBtdAML32820c1cEZCetJ7o+XJG+JrvZJtrUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791905906; c=relaxed/simple;
	bh=s6T8spM2x6Woqc8kym9Au794HZwMIaf8dTKwoStlP9A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rsDnqfmtPZZPYPKrOAu39X0f0OPZZlyavaT/IXHOSGQM/asjTXCb3qc5LqidBHxE/3MVrf/IQmwIBGWhNaMFaF0O5Cmp+ge11oEHad3F95TiJ6US9FnGZ2wvAjkMcHhiCk6znLbutwud0tvRbbAjtyA0QhkRFpNCg0YgOWJB6Lc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=WCXoskXl; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="WCXoskXl"
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 22415200758;
	Tue, 13 Oct 2026 17:38:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791905896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FyuYj7EievWUMgkf0Dgy2n1ZW/X2wRzzOHWZkhZbtcQ=;
	b=WCXoskXlLE6JKfoDacaebegBbaCAdke+9GXp4dlDb49ve4Jr3/c6+xkbZN5NfcqYxTDZ+H
	3Fm/6azMf3kt+yFsOCBEX5ioOvAhNLAKGLqVM/zYqLtCPpM/Q/9W0CiP6p3OVfqfX913Nr
	2yvOqBo3Ohld/+MepreQ5Y9spHQ4AyqjgU49vxfo/GHOwjBj5WVrsum0Yp3W/zjk43M60M
	pG0ip+wv36xiwwkBOHWWQgMvZYbMjjXMYqkvtViPZZLQgQvlC0u0HsU6SuGeBUiZVmi34W
	+dEWwcv4Y9dLK6QXwEydeOEX6Qxvd5Si96Qa+8Dk/GHGmzb42XkjggLd0U0shg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791905896; a=rsa-sha256;
	cv=none;
	b=aKpUxBQ5pAurauYivFh3hnYNj1amaLsW8N/beg1AAZEzyJ+WaA+mfARRFjPtEhIS2zuSX/
	gzy4/uiwBIRZcFcBiQ7Z8VoADF1PFuBAer6w+Yiuotwfr80KQuZYRuYZ2qIACAvljPUsnm
	2ycJdPb0UV7mV89pN3ZFfnml2pYXXHuPiqhJy63m7kyD220WVqG2kTfukzKrXiznf4BJBY
	Gn3KOSHqpIZpzrVGjKdbib79QouHKuh0PN9LU8oea1kTauTCn/m/btC/XKVy08ioO8EsGx
	HNhA8+ujQIeoQNINxkhXtvI0TIF9CdkhrB7Kt64jyepuFWJVycsUn8vLeXjkaw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791905896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FyuYj7EievWUMgkf0Dgy2n1ZW/X2wRzzOHWZkhZbtcQ=;
	b=ULIJqL43g5HjEELGUYbeHFJQiZ8BcGtdOodoZDkG7Ty4SXmEoVqzeK34cEWDcgaTkrG55c
	L6DXOZi6eDjw7zN55m2mnhXEb/hk1jXe8Wfar6OMVg8+Y3JxMnAKkpxpa5ojSS/BoS1PWv
	jY4Xg2jzb57NwdQmyaFTCvoX0r6+fNbsREkQo3frXovsvorlTyVotS0y4Fit9o0xIJZmBE
	VDQZ51t/yRl5Mvhg/fDZxNXuE56PKg2al5Ednc9F34AMdgujb6JZEJI+hh5hEyzXUHtM1p
	ZSVvfH4HAFqwbOLRqKj2QdDlxilK5NMpL64inqpcnCAyMH9J6sxY14Cu2/c2Fg==
Message-ID: <f6ebd774c7e65410c70074c94eab966418d7ac9a.camel@pengutronix.de>
Subject: Re: [PATCH] clk: stm32: add support for reset_control_reset()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Stephen Boyd
	 <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
	 <jbrunet+clk@baylibre.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 13 Oct 2026 17:38:16 +0200
In-Reply-To: <20261013-ups_reset_control_reset-v1-1-f8a6c7f6cc3c@foss.st.com>
References: <20261013-ups_reset_control_reset-v1-1-f8a6c7f6cc3c@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Di, 2026-10-13 at 16:52 +0200, Gabriel Fernandez wrote:
> The STM32 RCC reset controller currently implements only .assert(),
> .deassert(), and .status().
> As a result, reset_control_reset() returns -ENOTSUPP, forcing consumers
> to open-code the assert / delay / deassert sequence.

Do you have specific consumer drivers in mind?

> Implement .reset() to provide the standard reset operation and avoid
> duplicating this logic in consumers.

The (documented) purpose of the .reset callback is to allow handling
self-deasserting resets, not convenience. I try pushing back on
unnecessary .reset implementations in reset controller drivers.

There are a few drivers with direct level control that implement .reset
like this, but those are mostly for the benefit of consumer drivers
that can be paired with different reset controllers, some of which are
self-deasserting.

> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  drivers/clk/stm32/reset-stm32.c | 45 +++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 45 insertions(+)
>=20
> diff --git a/drivers/clk/stm32/reset-stm32.c b/drivers/clk/stm32/reset-st=
m32.c
> index fc237fccae68..9b853417e9c5 100644
> --- a/drivers/clk/stm32/reset-stm32.c
> +++ b/drivers/clk/stm32/reset-stm32.c
> @@ -4,6 +4,8 @@
>   * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicro=
electronics.
>   */
> =20
> +#include <linux/delay.h>
> +#include <linux/iopoll.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> @@ -13,6 +15,13 @@
> =20
>  #include "reset-stm32.h"
> =20
> +/* Hold time between reset assertion and deassertion */
> +#define STM32_RESET_ASSERT_DELAY_US		2

Is this delay enough for all possible consumers, on all platforms that
reset-stm32 supports?

> +
> +/* Polling of the reset status bit after deassertion */
> +#define STM32_RESET_DEASSERT_POLL_US		10
> +#define STM32_RESET_DEASSERT_TIMEOUT_US		(10 * USEC_PER_MSEC)
> +
>  struct stm32_reset_data {
>  	/* reset lock */
>  	spinlock_t			lock;
> @@ -119,9 +128,45 @@ static int stm32_reset_status(struct reset_controlle=
r_dev *rcdev,
>  	return !!(reg & BIT(ptr_line->bit_idx));
>  }
> =20
> +static int stm32_check_deassert(struct reset_controller_dev *rcdev,
> +				unsigned long id)
> +{
> +	struct stm32_reset_data *data =3D to_stm32_reset_data(rcdev);
> +	struct stm32_reset_cfg line_reset;
> +	const struct stm32_reset_cfg *ptr_line;
> +	u32 reg;
> +
> +	ptr_line =3D stm32_get_reset_line(rcdev, id, &line_reset);
> +	if (!ptr_line)
> +		return -EPERM;
> +
> +	return readl_poll_timeout(data->membase + ptr_line->offset, reg,
> +				  !(reg & BIT(ptr_line->bit_idx)),
> +				  STM32_RESET_DEASSERT_POLL_US,
> +				  STM32_RESET_DEASSERT_TIMEOUT_US);
> +}
> +
> +static int stm32_reset(struct reset_controller_dev *rcdev, unsigned long=
 id)
> +{
> +	int ret;
> +
> +	ret =3D stm32_reset_assert(rcdev, id);
> +	if (ret)
> +		return ret;
> +
> +	fsleep(STM32_RESET_ASSERT_DELAY_US);
> +
> +	ret =3D stm32_reset_deassert(rcdev, id);
> +	if (ret)
> +		return ret;
> +
> +	return stm32_check_deassert(rcdev, id);

If polling is necessary after deassertion, doesn't this be have to be
moved into stm32_reset_deassert()?

regards
Philipp
