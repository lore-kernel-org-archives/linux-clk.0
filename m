Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0E11CCB5C
	for <linux-clk@vger.kernel.org>; Thu, 21 Nov 2024 23:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732230187; cv=none; b=WyQVbWlTOCik0f6Yl0LrEzk1cUb9tGjpnFvGrNLxau+/qco1fn/o/uzgK3PoIrK8mW+rc9Fw1gF0Ziglp9kdya8XkQltMPj0r8UWT4kalqJOZXyrUsYYVPh8vrQWgkI+VUAspxJpLn0ubQFIpHgZFrP8DCinh+GBy1oFqyHUbXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732230187; c=relaxed/simple;
	bh=vc/Yb8KG85y6S7/E2NrNzQRgMb7lSf71FkMY3vKH0cU=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=qJe8BwBeY3B639qVHMEK681hLia7j0w0FSoWDSl+U/uc7HCIuyBKQJbISl7ZkUcTTTnMnPNiYt64zDCSTaSMBMbhl1ooQ86BYf/JPb2DA4wrdHkyvnGsu3hIF5QvKfZgTrg4R2ojejXPn3pjzWe/000TiODk9cCazFanpEY+3Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FKUk84aa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FKUk84aa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AADDC4CECC;
	Thu, 21 Nov 2024 23:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732230187;
	bh=vc/Yb8KG85y6S7/E2NrNzQRgMb7lSf71FkMY3vKH0cU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=FKUk84aaxPcOxYp9VAekpehD3fgfh1VmfWKjoUWpmlDim3MccEScW2cHSICG6elvV
	 iYp1mnHb5/qTvVgfSzvWgohcQ839YJ/AzqAlRf+jBNnTg2CFOZUkFdt7+Jdur/zeJY
	 tNpFci5AmoR3C5XUBWMjoHsMdwo31YugFhh6N3gCuW22cn0YXFBTwQ5q/cWEtRiQaI
	 q+rxUNR1TNNS8wcx4EO3BfoKdDYrxmtPWYXCsY11kyEKLgCZiEoEsYlc/O2u9xsfSv
	 IJHdn05a6oTwKeFVOhcQdzCpZCTziHO3n9+Sk1zWdU5Br9HsKEjD0mAPyFHVp/PsMN
	 W1NsyRfFYaWNg==
Message-ID: <a45e4e8d5ec8be3ef659969a2fb3b6c0.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <SN7PR12MB7276EE2CA7208EBF7391F2858A222@SN7PR12MB7276.namprd12.prod.outlook.com>
References: <20240722121910.14647-1-naman.trivedimanojbhai@amd.com> <ac67f76d4b4b5f4bf108c1457f1263c7.sboyd@kernel.org> <PH7PR12MB72845D56BF4361441AA9CB9A8A852@PH7PR12MB7284.namprd12.prod.outlook.com> <1234a0176de236abb603f96ab9a1d6a1.sboyd@kernel.org> <PH7PR12MB728472C3022ADCD8DF5576DD8A962@PH7PR12MB7284.namprd12.prod.outlook.com> <7f295bf3b095bace843c28adc9941344.sboyd@kernel.org> <SN7PR12MB7276EE2CA7208EBF7391F2858A222@SN7PR12MB7276.namprd12.prod.outlook.com>
Subject: RE: [PATCH V2] drivers: clk: zynqmp: remove clock name dependency
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@ <"vger.kernel.org linux-kernel"@vger.kernel.org>
To: "Simek, Michal" <michal.simek@amd.com>, "Thangaraj, Senthil Nathan" <SenthilNathan.Thangaraj@amd.com>, "Trivedi Manojbhai, Naman" <Naman.TrivediManojbhai@amd.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, mturquette@baylibre.com
Date: Thu, 21 Nov 2024 15:03:05 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Trivedi Manojbhai, Naman (2024-11-21 03:49:46)
> Hi Stephen,
>=20
> While debugging further, I found that, CCF registers the clock by their n=
ode name if the clock is present in DT. This was causing issue when the clo=
ck node name is changed. By adding clock-output-names property in the clock=
 provider nodes in DT, it ensures output clock name is not changed. This DT=
 change is sufficient to fix the issue.
>=20
> I have submitted a patch - https://lkml.org/lkml/2024/11/21/412 to fix th=
e same in DT.  So, the driver changes which are part of this thread is not =
required.=20
>=20

Ok. Sounds bad still. It would be better to remove any string usage to
describe clk tree topology in this driver.
