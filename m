Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793171861;
	b=5XFxoHa93BFhMg3+DUxvI4iK9KetU/HmB3qVjifagO1u1wA5x8A/khQ5wtJfiTYnrmVk
	 IvOf/tv78hlfCczRiIwuzmk1l3vc/aXtIdlYI0r7exqBHP5FL8a5ASqhGcAcEEHEEqPvX
	 LiBaG7NOETWZp5EVk0jGmZOzxRTRe7u0gj4Nhxm1Q9YvmHdRPuGImHlYDATUa4Ae09UuK
	 EhSVyTX5M4cX/GURvehE1Ui6vT3fudgyItLFFkQeTSDbSJ7UCWytldjLu6fmgGullEZx4
	 0i3zOvIUbUGKvM/c0XW6DylZAz+Z3nGT8G0h+sPiud4fydrFP864qZRQmFeilG6l97g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793171861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=X3qKYmW+KpgKThN2slX/odFU810T68LPK+2Pye7ps2w=;
	b=2O7o34MX3e/2gbOj1FVnn+MJ4ultRMHNfZ/nBcBSOYgl/eS8EXJnuIW/AStBl1EVSC1p
	 mjYOE9FoTMIT/tziOGI2YqCdpl2Cir4BInhcRBxnEaZDwYbkBdY/ljmknAVbU9T8fSlpK
	 mPDZ5K6cAgByj8dgIHNasoVwWIoqC541TLDUqxdzHpovPhzQG8yK5wRUvYuHJXkSzTQ8u
	 ROw2TKegrW7zp2KP6bCtktQkvJv/RE7gM11eYw1JsY7pyi0o/CZs1avrTKcS5EUDzJtPF
	 K9QT6jU49H1lw4K3AB+ZIPDtis+GunJUGTIetw8IJx+Dgh3keuz+KWmDD28vPv7GQcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mXYTeY1D;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E699E606A31A
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 07:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E699E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mXYTeY1D
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so5128035e9.3
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 00:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793171859; x=1793776659; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X3qKYmW+KpgKThN2slX/odFU810T68LPK+2Pye7ps2w=;
        b=mXYTeY1DFU0B3UNUDpGvH1++9XqRCHBN2c55fDs3gaMOQO47WsY0IeKIoXEOK7phre
         qDRnMs8ytOMr0qtfMOSb8TiEdkTuTi3zrvIo29YjRcHCIyNVRu5jvmrnw+c/7+ZTnZdu
         g+m+dlrewe4oGQ7cM44EPt9kdHQxTNGMX2vBj7nmA41j8BZlObfZrV/xzfLKEfzFF9JV
         zX00cy7U2P/7MMHvf57mTP9FPWSpdqrAGPOP7VFbEtS+I5HsiFc5gBOTKp40co7SyViU
         LmvhwSbNkcVsBfy3XytO1tE7SOLtX0a18awiJgg9Nhufe0Sw0QKxI65RIMv39zTiKOBc
         rFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793171859; x=1793776659;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X3qKYmW+KpgKThN2slX/odFU810T68LPK+2Pye7ps2w=;
        b=S8azEKIfMyR5unWMoeHS2kcvzInep5/0gPrMiAy0s407AaHTj8C9En1DC3T3O3rPo1
         HVkZSPjr7Ic0d73qXwqWRtuARsfecfUq28IdzFJN2DqV6uUxtIlCwTtNThyiGsg2/Grf
         RmrdpCgsVquVPj37i/YC984eAPyd7Lzc+hVBzCi35ybCfIdoPm6w7GuQvsm6Ppngg30w
         EYtysMC9sGrAYiB1/SE8stDw2ldE6Los8ByHIenYZeEI7Irgd97jwQAMwTe+y9Vx/Xmf
         LX4G+KYh9VXNWsh0IpMR6G650IU/xwO4jVCIfj1FsUeHdD+K+zwqumBrxpdibEh2T0BW
         dsbw==
X-Forwarded-Encrypted: i=1; AKwUvBx7WHLXAiRnxMcRa3sSaAndhUGPX5x9WCAWTY3UcWpqHiKAoC7O+Vz5XRs5HaDAPy4DJ0zKbQkT7fM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLJeIuchPlFde4T8ltRP3jC+t4KU0x9KlNwjzZqW44C0V5RN2l
	jHJWZtTkEiDadwA+TnSl8Yym/oAgcrXp6MY8N2KSB4R36oGhuXu3zV1bOMTl0bgt7SM=
X-Gm-Gg: AYBFou3kdkLtQXDMgEbsXVfunRVi4CfMizXcd97n2Eaep4DcBPq2r6ihCdgoHVCNJrn
	bDR+g9vire4ArRu4JSpLAABH9igpzMgCBQbVPZ0NsAkbSjpojQm8U/7Q4fLni9cgigr8ik2y5mM
	Cg/4gdyLxEKTSwLqHMZ3aYk74jY4D+cDerUn/im6ZkKKqWNFTKNYjtEZ0+kxRjj3Cmyjewv0En1
	jU37W3PpvFXz3QoFjUWKUgupnuwNtaHykBYHF8VhO75NF6nRB91LbEVl/nHQqGQ5+Ak9xRRRmua
	iZwPgFQP5QBkNKTs8rsiYbgUOUgwIpQtft6bh4QUAZLnyrpNT+xRpfFhJ3qmyR4a4r7rh+vHJNS
	zNwfTcBMClaR209BWCacN6RNKWEkoovqETenkvjgZqPc37dU1yjT134fXPUVEYQB7oooSU9PK3j
	LmtADoU1hqH7ZHLLrs9znLZ+M1rb5JVAE32i8lW763GlxD/IyJqCmBFUxDvXKSjS9kzBzoQqR20
	LlN/WsFc55LE58lcPJqeEhkCrOx2GvM3X9WVdz+Amm3wcUVGIEjskESPBoSHTvMxpDcgmuK7az+
	8XwQ8M/HGwkUVmDlpn2Xp78reN+aiwS6Y5u9KmC5ragZKWwWaslF2mGDj75cU+KJMg3tMwl/+3B
	B3iqZZVG+xj7zO4M=
X-Received: by 2002:a05:600c:198e:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4a967ba8856mr25106675e9.33.1793171859280;
        Wed, 28 Oct 2026 00:17:39 -0700 (PDT)
Received: from localhost (p200300f65f19a904c16506b94501b867.dip0.t-ipconnect.de. [2003:f6:5f19:a904:c165:6b9:4501:b867])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a97bf5d7cdsm20719315e9.3.2026.10.28.00.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:17:38 -0700 (PDT)
Date: Wed, 28 Oct 2026 08:17:37 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: gaohan@iscas.ac.cn
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, 
	Inochi Amaoto <inochiama@gmail.com>, Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <me@ziyao.cc>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-clk@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 07/18] pinctrl: zhihe: add A210 support
Message-ID: <auGhPHjanNTkkzG-@monoceros>
References: <20261027-a210-scmi-v1-0-74d58ce85bd8@iscas.ac.cn>
 <20261027-a210-scmi-v1-7-74d58ce85bd8@iscas.ac.cn>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bf4vux6swhzzilrx"
Content-Disposition: inline
In-Reply-To: <20261027-a210-scmi-v1-7-74d58ce85bd8@iscas.ac.cn>


--bf4vux6swhzzilrx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH RFC 07/18] pinctrl: zhihe: add A210 support
MIME-Version: 1.0

Hello,

On Tue, Oct 27, 2026 at 11:36:58PM +0800, Han Gao via B4 Relay wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't use <linux/mod_devicetable.h>. <linux/platform_device.h>
already provides of_device_id without introducing a lot of unneeded
build dependencies.

Best regards
Uwe

--bf4vux6swhzzilrx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrhoY0ACgkQj4D7WH0S
/k4lEQf/aQompiZrE8lzHamk+WXWr2kv9iqPDmKByLu358ny9EKvV3eNOG0y3m2B
hMQ9inmxBjyfz0TMb3NkQtmXVKnu41A8A6mcl3B97akrhcvKxPDgsn8FWhhNJiBs
s0jrcYuMILEssk5h7k5Ah8fEdVAXbDTp88j/afUmb9QfOZxjaW+SXfLYigacUFT0
U8Hy6rX3B+GESX5uvdxOY69bn4dHt7Qwr56FksGQtIi7Y9DbyRhhMRnwCy4pCLnw
ZD9t3GwAHwOm1fdsdqP0zLsJPukoZPNmbT58FjRf45TfYHmOSulG5O3oszd4ElAw
wrbitVSdlgy1G4VvYAZKJRQLV5gF2Q==
=JnXH
-----END PGP SIGNATURE-----

--bf4vux6swhzzilrx--
