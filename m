Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B35019BAC;
	Fri,  8 Dec 2023 10:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="admXh1CG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E89A9C433C7;
	Fri,  8 Dec 2023 10:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702031449;
	bh=FfltjaJi2+BieqE4CIh0XJv2dzvZ1vd9wCo4Z9ia5sw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=admXh1CGnFPD0M35Zxc9R5HKFPgrTM8vn6dy1dC0aNCX5V6pFYRU+8Y50Z9+FQFHZ
	 90WnJHrL9wuyLIq5eaQMn6p/ASCRKvelZioSv/h57qeT/CfpfIK4Mi7vZg6czKM6dF
	 zeVrf9NqRO+7L0ChgKVMmeZJ+ktc/izPmaGrLsWTBZVwi6Yotb3FEqtRvsVHC6PK8S
	 7KnBkCuAPv27JJJa2dhSrqaZp27IfW92T5XmDHjK5uP6RFD/4ArfzPeXUu5ieAiglV
	 oMF8jV9yLMclCKJg0uI/aLJ98+DGQzUWqyyYGOTPUgStTMYVwtzwOwSxri+3TTECva
	 Gu8LusU2UFLgQ==
Date: Fri, 8 Dec 2023 10:30:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu,
	chao.wei@sophgo.com, krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com, palmer@dabbelt.com,
	paul.walmsley@sifive.com, richardcochran@gmail.com,
	robh+dt@kernel.org, sboyd@kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com, guoren@kernel.org, jszhang@kernel.org,
	inochiama@outlook.com, samuel.holland@sifive.com
Subject: Re: [PATCH v6 0/4] riscv: sophgo: add clock support for sg2042
Message-ID: <20231208-item-rubbing-e32503c6cdcf@spud>
References: <cover.1701997033.git.unicorn_wang@outlook.com>
 <MA0P287MB0332EEB2858B8B39F151CECAFE8AA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FOIXGebSdyFCZivi"
Content-Disposition: inline
In-Reply-To: <MA0P287MB0332EEB2858B8B39F151CECAFE8AA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>


--FOIXGebSdyFCZivi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 08, 2023 at 06:11:10PM +0800, Chen Wang wrote:
> On 2023/12/8 9:13, Chen Wang wrote:
> > From: Chen Wang <unicorn_wang@outlook.com>
> >=20
> > This series adds clock controller support for sophgo sg2042.
> >=20
> > Thanks,
> > Chen
> >=20
> > ---
>=20
> Hi=EF=BC=8CConor=EF=BC=8C
>=20
> Can you please have a review of this patch?

Chief, you sent this patch only the other day, please give people some
time. I, at least, have an MMO addiction to feed in my spare time
alongside reviewing patches.

> And I'm not sure if you are ok to pick up this patch so it can be merged
> into the next v6.8?

Stephen is the maintainer for clock drivers. I do pick things up and
send them to him as PRs when it makes life easier, but usually that's
after other people have reviewed the clock driver itself.

Thanks,
Conor.


--FOIXGebSdyFCZivi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXLwUwAKCRB4tDGHoIJi
0u3nAP9Rokitj/wed1daTNpVLWtV36eyiRYsx6oI80J6OThGUQEA4exOUcph7uDB
lcTp1MOSck2qJMA3zfVvmMSiBj9WRQM=
=B3l3
-----END PGP SIGNATURE-----

--FOIXGebSdyFCZivi--
