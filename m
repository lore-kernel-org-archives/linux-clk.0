Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF3E13A24D
	for <linux-clk@vger.kernel.org>; Mon, 12 Aug 2024 17:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723485431; cv=none; b=BJTmJDlVbSAbNpzuANUBzyiylWmm/Ne9DtMcBwbTCRo4WeczC6upxMzQ1M6GCx8Lvdvq36z1PULmC+LMlkj2yExatPkVYUoPfemt/ApZJIJ3MxStGdWYO7K0+vjftskPLl4+Tpq2q7/S/d9KZrb9KK9hCfTVzvkXmat7SfVkt1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723485431; c=relaxed/simple;
	bh=y4b9+OcKwSJZfc1z9hrVu0x+F+TJyq47YaWp4jA4/TE=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=V7iwT87dsjNvzDPbgDUZqD+5/WTQvN5FzoN2TjN9H79vPVOyJfCo5m5Hops9KFJqsGGt++DmovJTiGri+6+NUVILLtevPjOk3G9tiF5AsWdRkLHdUzmqjIoi0SmkBBXhjH53loBU+0Ve4BsuXLtpELIFeVvxKlLhyEjXvUT7zL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e450SL78; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e450SL78"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0143CC32782;
	Mon, 12 Aug 2024 17:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723485431;
	bh=y4b9+OcKwSJZfc1z9hrVu0x+F+TJyq47YaWp4jA4/TE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=e450SL785TdmNWjpKjX4xGyu9MAF/3LB+lf+AfuqgNZY5zmdLQKPddT8zauOUR7PW
	 rW3spmLUlvg0tVecZRH1JHkTnvg7nZ0uJWhKd2LNRK6OSYky6Rpj5LYVWzcRQBtS6G
	 eFKqXkZb4KgCcGoWMKRxlFaS951ANPufbOqq2i9R0oLKIPmYvlcYXUoXIfBApAYZcG
	 b8SI54JsihS62TRg3V6EvpaQXpMzbwT8zVae5S5Nvp2cTCiNU+dxO0XzkS+n9uYeOL
	 EL4B13elwgLihTWLUzE2Eu1eIrPrlxGPD/7R37dghakBPfClA/WYAb4UCbIXVDXlFb
	 HuD9MdGEqdPfA==
Message-ID: <302977bb2af9ed75347e0e41cde53a23.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <43970fbcd1871823325121d255af117dae8107ee.camel@gmail.com>
References: <20240710-dev-clk-misc-v1-0-cd9d960099a2@analog.com> <20240710-dev-clk-misc-v1-2-cd9d960099a2@analog.com> <3b5b22e21cdc184a9f74db4ff9167a58.sboyd@kernel.org> <43970fbcd1871823325121d255af117dae8107ee.camel@gmail.com>
Subject: Re: [PATCH RESEND (again) 2/2] clk: use clk_core_unlink_consumer() helper
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Nuno =?utf-8?q?S=C3=A1?= <noname.nuno@gmail.com>, Nuno =?utf-8?q?S=C3=A1?= <nuno.sa@analog.com>
Date: Mon, 12 Aug 2024 10:57:08 -0700
User-Agent: alot/0.10

Quoting Nuno S=C3=A1 (2024-08-11 22:22:54)
> On Tue, 2024-08-06 at 14:50 -0700, Stephen Boyd wrote:
> > Quoting Nuno S=C3=A1 (2024-07-10 01:40:36)
> > > There is an helper to remove a consumer from the clk provider list.
> > > Hence, let's use it when releasing a consumer.
> > >=20
> > > Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> > > ---
> >=20
> > Applied to clk-next
>=20
> Hi Stephen,
>=20
> I realized only this one was applied and not the first patch. Could you p=
lease tell
> me why it's not being accepted or if I should do it somehow differently? =
Or it just
> needs better look at?
>=20

I will re-send the first patch in a day or so. I wrote a pile of KUnit
tests for it.
