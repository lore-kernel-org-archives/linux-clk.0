Received: from mout.perfora.net (mout.perfora.net [74.208.4.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5F438759C;
	Fri, 27 Feb 2026 09:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.208.4.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772186364; cv=none; b=Od1h2EJHF+6ZzcGrD/E/JfV9yJXW11KgdTUkL5WbkyNFEMolLeeVSlr6Wcvppnojj4NJ7sqMknVLENiwts2yewbuSmDZpBpvo34tvnP5L3Xl/T+TrM5OCrtFYd1Lyl5wEyV2xafgHv18iHiaytKlZo61gh+ZkfLyaNRDSTgen6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772186364; c=relaxed/simple;
	bh=C08VD/G1+BOfab62jb6baPW4lV0bNNCBv/1Pwlx552Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MdykeIdxRXmpr8s7onuaYOYmgTnp+u2P4sNXe9/LuEGL5tRBWKnLM2xFqq15flMX0dvVNf8//KEmparcNGxIOB/ubUXUWVArgmDP3SRdXdrxu3BKChfsjnzjEmZixscDbUhDqW6lriQWFpp7Dq+zkZDR0wtPXmSy4It+rDOPa6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ziswiler.com; spf=pass smtp.mailfrom=ziswiler.com; dkim=pass (2048-bit key) header.d=ziswiler.com header.i=marcel@ziswiler.com header.b=rjib/TU5; arc=none smtp.client-ip=74.208.4.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ziswiler.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziswiler.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziswiler.com header.i=marcel@ziswiler.com header.b="rjib/TU5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziswiler.com;
	s=s1-ionos; t=1772186334; x=1772791134; i=marcel@ziswiler.com;
	bh=C08VD/G1+BOfab62jb6baPW4lV0bNNCBv/1Pwlx552Q=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=rjib/TU5BE6GpSPKMgoNL4MOPHm7V0o42Co/DSv7SqWLqyq8NeKtRFNpiUQd1eIt
	 z89aP3O3ZKJ/9Xf3Zi4/bLQQyYn1WdioHnzaSqtLU19d5EnSYBLd/EXNC8uhPv9W6
	 nn9I1W1l3vA+ORBufo60jClMWNPAFJOJgXrWK+DdIKtLrSIS8TQFqEjk3ZkecNl7G
	 xuv1/1l2Zn8FIcmRpFnqNo9y+TL3CRdrUeaSNA/6uO6bHKAfuanJhtQunJm76CHt1
	 GbcECGUQQKwlWOv1mpVcR685hrgeBzd8nR8UZoFLb7P2EN7TjxmmT6ApKntePOfQj
	 ivQr3qv8IzfTPn8PhQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelay.perfora.net (mreueus004
 [74.208.5.2]) with ESMTPSA (Nemesis) id 1M2Ohe-1vzku0063y-00Cbyw; Fri, 27 Feb
 2026 10:58:54 +0100
Message-ID: <480710d6267ebca0f94ca628d588b910735f43bc.camel@ziswiler.com>
Subject: Re: [PATCH v14 0/4] Add driver support for ESWIN eic700 SoC clock
 controller
From: Marcel Ziswiler <marcel@ziswiler.com>
To: dongxuyang@eswincomputing.com, mturquette@baylibre.com,
 sboyd@kernel.org, 	robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 	linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 troy.mitchell@linux.dev, bmasney@redhat.com
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com, 
	huangyifeng@eswincomputing.com, pinkesh.vaghela@einfochips.com, 
	ganboing@gmail.com
Date: Fri, 27 Feb 2026 10:58:47 +0100
In-Reply-To: <20260226090513.1696-1-dongxuyang@eswincomputing.com>
References: <20260226090513.1696-1-dongxuyang@eswincomputing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:gfyavZPowaQjscEB8JL71wgmsNZDB6vDGCYA/kJA4ug89V2/y14
 K2WkqDh8Dd7gPyqoCt9Ik9PBoQyxjbJDomZMsJt+MBKUhWYdz+br65GkbqHxFzjN5itR9lp
 J0ZIxiGj9nDY5FTU48gkfjSsfdLPyA6MuoFmx8vxnGr8GxV7YphHsmus8lYT3ulJESxb38u
 VAYWm82ETPXbOpUjmXNPw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:C7c5xz9oLus=;o6zR6H3rJ6qt/McRiu8XwRpmgwV
 3SZS/Bhp84bkiRdf3sk5MR9uakT4hOAsns2h3qRnBEYvL2o+uvS2yoPaXIaQLc7bNa4nTZWoy
 zzJGP5n7QX7F8DGsg2EckTJHXIutjevVcxYtOpxUKFFZXbpJVF2gkp4pP5jchEdzS1aWc41mS
 fwcXkfv90plBfyUMq/01/F1McYDIgPogNoelRFDge1w14N73gkPmssDqC85+MGioHrZn7sEX2
 cU610c0UQWbpv9pqut+Vl4plFaY9YouT33tOwZkcwiz6sywat/fa/XDn/Ds59MVj/bAeUBTMG
 UBU/pYGtmwhT/4OrpcwbspZ7JU9PvrQ5EfoauRuTEbSI0JCc0UoQSIYXf7kuY78KjOAPh7ONi
 Iy5ONocDicyLwz+njTr3rDqw8nb4BN/XahvRuwQ73Ked7jaG8qiLhsZLu8vg+lENQ3GwguCOC
 5+JI0afhJV2BFCgU49xfZOdACE6/+D0Uwe5IK9bIyiSyZ2ZiA7vgHQLy8q+tAbwzQxc1XSLF7
 IvRiFc2MO1DGeqIwlkahVyaHCRP+mQtqiL8B5vFE5j3dy6zdGCBwiDqejvIIRX9DyvhUpbaKx
 pEwje8w523p9J8SkMZGMg8T6DTRYCs73dkdbZ7oDqRp+my+O4Van++MssYdzX2xQWHYbfhXpm
 Z3H7/zxeOlHeOZNcCs6U4C4F/BrdM/5KDWa+FfAOUFvI5xYI7yjBC0tcLNDy93Uob8FD4DAHV
 JpaLXykBJpH5o7GAjAm82M7djOGtQX06nkMp3KVGNRSx41dNss0rXDRIjufqNr9mz+2HyGTel
 AKmVU9o33G11bTbn6mZl1JwLufT31XwukaeMambkIsbuKs9OkeQWb41rYvbji3eyab90Z7xpD
 mm3IxOIY1nS8iH7pHP00ha7oRPuCgzxdvkhbZFDiHj88xESQetS1obZ87dxVT+6PJ2wStKSts
 WfaCTX6HkbaFyHAXkBvlodPEEj6PQhXI1KHVWce/+DP+yP8VtqEHrL0Q7ffOx1bxHb4Wl+NQP
 K9ax7GhI8uTFqVZ01LvHhQ6doKRWHtAv5d+0Wnf9GEuBL2abMC7z2vjN98RNFjJFLGmKLV5ko
 MlE58x5mckT4NyKKLY8M3Vi6dnUe3v7Axd3Lzgi7G6oryMn0vzj9lSUWvCOrD8C5fNlWzEnwd
 /aYPHkjlCJCyl7DUvGirkPHZL8eij+FKhcPTPk72e9X1Ee4ARmsg6j+1WRt6DdZAy4K0AQXXc
 oMpsAoCChdFDg4xfPGCp45dE5q1R6ZE16jkVEmlX2+FISjCtB2+uT7p/4garEA47Zk+C/yDDN
 OJjubvzR6k76fZx9FZlCfU/gJ5A0bs9qbj6NOmNQW7ZDc2YGUe7hIbEPmC4Hs5pxTuPSFjglV
 sQDbAYCtzCKZzPBRH3Fv2QCwyFGikR97kpEE5Go8kuu4OzJbzN1SknNUpDrjgNnZYsBJI85xA
 UYiz38yIK7/k5i7qT1tsvsGm5Ac4B4GVA37Pp+pl+FTz8Bq5UOxvpQstApyPTpU9PMcrbZ2Y5
 6oX7td0jk//3kBDBPKm06hI101AqkZvXRxbEYv7oR+nj9JonmlHIja1TPthDnVO4hoyD5/aLI
 3oeq3vNtww9fYC8v3eYHlZiy/TVRf1Mi1VFS/XCBflvqZjtsCoDLdoS+JzNoA6DRTQwqd7tWo
 x3Oo5M0/WxsI9i0E+cg2K4IW1UtOD8jz3EtRwCzR5xe6ZQ+3rVrBY1Wkaex1YazmKPmej5hol
 EUJhjANZu/a5r9xNxEWlx9fm+tF60uOEnAXJM1F2+7xvkb0AoG8dqNOQ=

Hi Xuyang Dong

On Thu, 2026-02-26 at 17:05 +0800, dongxuyang@eswincomputing.com wrote:
> From: Xuyang Dong <dongxuyang@eswincomputing.com>
>=20
> The link [1] provides the official documentation for the EIC7700. Section=
 3.2
> covers the clock subsystem.
>=20
> [1] https://www.sifive.com/document-file/eic7700x-datasheet

I can confirm that this works perfectly now even without clk_ignore_unused.=
 See [1], [2].

Thanks!

[1] https://github.com/riscv/meta-riscv/pull/602
[2] https://lore.kernel.org/all/e2130fa8e18cdffb9be9426a8576e67675e87d55.ca=
mel@ziswiler.com

Cheers

Marcel

> Updates:
> =C2=A0 Change in v14:
> =C2=A0 - Updated driver file
> =C2=A0=C2=A0=C2=A0 - Change the error code returned from eswin_clk_init()=
 from -EAGAIN
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to PTR_ERR(clk_data).
> =C2=A0=C2=A0=C2=A0 - In eswin_clk_init(), replace NULL returns with appro=
priate error pointers:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Use ERR_PTR(-ENOMEM) for devm_kzalloc() =
failure.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Use ERR_PTR(-EINVAL) for devm_platform_i=
oremap_resource() failure
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and remove dev_err().
> =C2=A0=C2=A0=C2=A0 - Add the CLK_IGNORE_UNUSED flag to gate clocks. When =
clk_ignore_unused
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 is dropped during testing, these clocks sh=
ould remain enabled.
> =C2=A0=C2=A0=C2=A0 - Modify the frac calculation formula to:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 frac =3D (rate * 4 % parent_rate * (2^24))=
 / parent_rate
> =C2=A0=C2=A0=C2=A0 - Add step-by-step calculation descriptions in eswin_c=
alc_pll.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Remove the tmp1 and temp2 variables, using=
 only
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'rem =3D do_div(tmp, parent_rate)' to calc=
ulate frac.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The previous calculation formula was overl=
y complex.
> =C2=A0=C2=A0=C2=A0 - Rename offset to reg in clock structures. Also, rena=
me reg to ctrl_reg
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in the divider clock structure.
> =C2=A0=C2=A0=C2=A0 - All lines are limited to 80 characters.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 In cases with long function call parameter=
 lists, lines may extend to
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 100 characters to preserve readability.
> =C2=A0=C2=A0=C2=A0 - Drop linux/delay.h header file.
> =C2=A0=C2=A0=C2=A0 - Add devm_clk_hw_register_divider_parent_data() to cl=
k-provider.h (preparatory patch).
> =C2=A0=C2=A0=C2=A0 - Replace clk_hw_register_divider_parent_data() with
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 devm_clk_hw_register_divider_parent_data.
>=20
> =C2=A0 - Link to v13: https://lore.kernel.org/all/20260214101421.228-1-do=
ngxuyang@eswincomputing.com/
>=20
> =C2=A0 Change in v13:
> =C2=A0 - Updated driver file
> =C2=A0=C2=A0=C2=A0 - Modify commit subject from "clock: eswin: ..." to "c=
lk: eswin: ...".
> =C2=A0=C2=A0=C2=A0 - Use parent rate to calculate PLL clock rate.
> =C2=A0=C2=A0=C2=A0 - Use GENMASK() to define PLL mask macros and use FIEL=
D_PREP() to simplify
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bitwise operations.
> =C2=A0=C2=A0=C2=A0 - Remove shift and width references for pll enable, re=
fdiv, fbdiv, frac and postdiv.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (Use only the PLL macros to match the func=
tionality)
> =C2=A0=C2=A0=C2=A0 - Set postdiv1 and postdiv2 in clk_pll_set_rate functi=
on.
>=20
> =C2=A0 - Link to v12: https://lore.kernel.org/all/20260213094112.115-1-do=
ngxuyang@eswincomputing.com/
>=20
> =C2=A0 Change in v12:
> =C2=A0 - Updated driver file
> =C2=A0=C2=A0=C2=A0 - Add CLK_MUX_ROUND_CLOSEST to the mux clocks since th=
ey need a more
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 accurate clock frequency.
> =C2=A0=C2=A0=C2=A0 - Change 'rem' from u64 to u32 for function 'eswin_cal=
c_pll' and
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 function 'clk_pll_recalc_rate'.
> =C2=A0=C2=A0=C2=A0 - Change 'rate' from u64 to unsigned long for function=
 'clk_pll_recalc_rate'.
> =C2=A0=C2=A0=C2=A0 - Fix build error with u64 divisor for function `clk_p=
ll_set_rate'.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Reported-by: kernel test robot <lkp@intel.=
com>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Closes: https://lore.kernel.org/oe-kbuild-=
all/202602111424.mhTAakDX-lkp@intel.com/
>=20
> =C2=A0 - Link to v11: https://lore.kernel.org/all/20260210095008.726-1-do=
ngxuyang@eswincomputing.com/
>=20
> =C2=A0 Change in v11:
> =C2=A0 - Updated driver file
> =C2=A0=C2=A0=C2=A0 - Add "Tested-by: Marcel Ziswiler <marcel@ziswiler.com=
> # ebc77" tag.
> =C2=A0=C2=A0=C2=A0 - Fix build error in function eswin_clk_register_clks.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Reported-by: kernel test robot <lkp@intel.=
com>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Closes: https://lore.kernel.org/oe-kbuild-=
all/202602060520.p4Hg35Ja-lkp@intel.com/
>=20
> =C2=A0 - Link to v10: https://lore.kernel.org/all/20260205093322.1030-1-d=
ongxuyang@eswincomputing.com/
>=20
> =C2=A0 Changes in v10:
> =C2=A0 - Updated driver file
> =C2=A0=C2=A0=C2=A0 - Add a private clock divider API named 'eswin_registe=
r_clkdiv' to
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 register divider clocks with private flag.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Define 'ESWIN_PRIV_DIV_MIN_2' private flag=
 for registering the clock
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dividers whose division ratio start from 2=
.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Implement the private set_rate, recalc_rat=
e, and determine_rate accordingly.
> =C2=A0=C2=A0=C2=A0 - Add CLK_DIVIDER_ALLOW_ZERO flag to the clock divider=
s whose division
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ratio start from 0.
> =C2=A0=C2=A0=C2=A0 - Replace CONFIG_ARCH_ESWIN with CONFIG_COMMON_CLK_ESW=
IN in the Makefile.
> =C2=A0=C2=A0=C2=A0 - Modify the help description of COMMON_CLK_EIC7700.
> =C2=A0=C2=A0=C2=A0 - Move register offset definitions from 'clk-eic7700.h=
' to 'clk-eic7700.c' and
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 remove the 'clk-eic7700.h'. Remove '_CTRL'=
 from the offset names.
> =C2=A0=C2=A0=C2=A0 - Remove all unused headers.
> =C2=A0=C2=A0=C2=A0 - Use devm_platform_ioremap_resource() instead of devm=
_of_iomap().
> =C2=A0=C2=A0=C2=A0 - Export the functions from clk.c as symbols.
> =C2=A0=C2=A0=C2=A0 - Use readl_poll_timeout().
> =C2=A0=C2=A0=C2=A0 - Use 'clk_parent_data' and '.hw' instead of string pa=
rent names.
> =C2=A0=C2=A0=C2=A0 - Rename the header file from clk.h to common.h.
> =C2=A0=C2=A0=C2=A0 - Rename macros from EIC7700_* to ESWIN_* in common.h.
> =C2=A0=C2=A0=C2=A0 - Add a new function, 'eswin_clk_register_clks', which=
 can register
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 divider, mux, gate, and fixed-factor clock=
s based on their types.
> =C2=A0=C2=A0=C2=A0 - Add structure 'eswin_clk_info' to manage the clocks =
that need to be registered
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in a specific order.
> =C2=A0=C2=A0=C2=A0 - Add macros 'ESWIN_*_TYPE' to define divider, mux, ga=
te, and fixed-factor clocks
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 with type. Add enum 'eswin_clk_type' for t=
hese types.
> =C2=A0=C2=A0=C2=A0 - Remove 'eswin_clk_register_mux_tbl'. Use 'eswin_clk_=
register_mux' to register
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mux clocks with or without table.
> =C2=A0=C2=A0=C2=A0 - Add xtal24m as the parent clock of the PLL.
> =C2=A0=C2=A0=C2=A0 - Change 2025 to 2026 in all files.
>=20
> =C2=A0 - Link to v9: https://lore.kernel.org/all/20251229105844.1089-1-do=
ngxuyang@eswincomputing.com/
>=20
> =C2=A0 Changes in v9:
> =C2=A0 - Updated driver file
> =C2=A0=C2=A0=C2=A0 - Checked return values of eswin_clk_register_*() in t=
he probe function.
> =C2=A0=C2=A0=C2=A0 - Removed binding IDs check from pll functions in clk.=
c, as these functions
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 were exclusively used by pll clocks and di=
d not require ID validation.
> =C2=A0=C2=A0=C2=A0 - The PLL structure has been extended with max_rate an=
d min_rate fields to
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 explicitly define the frequency operating =
range of the PLL. These limits
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 were now utilized by the clk_pll_determine=
_rate() function.
> =C2=A0=C2=A0=C2=A0 - Removed __clk_lookup() in clk_pll_set_rate. Added cl=
k_notifier support
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in clk-eic7700.c.
> =C2=A0=C2=A0=C2=A0 - Added five previously missing clocks from [1].
>=20
> =C2=A0 - Link to v8: https://lore.kernel.org/all/20251113013637.1109-1-do=
ngxuyang@eswincomputing.com/
>=20
> =C2=A0 Changes in v8:
> =C2=A0 - Updated YAML file
> =C2=A0=C2=A0=C2=A0 - Added "Acked-by: Troy Mitchell <troy.mitchell@linux.=
dev>"
> =C2=A0 - Updated driver file
> =C2=A0=C2=A0=C2=A0 - Changed Kconfig from bool to tristate.
> =C2=A0 - Updated MAINTAINERS file
> =C2=A0=C2=A0=C2=A0 - Added "ESWIN SOC SERIES CLOCK DRIVER"
>=20
> =C2=A0 - Link to v7: https://lore.kernel.org/all/20251023071658.455-1-don=
gxuyang@eswincomputing.com/
>=20
> =C2=A0 Changes in v7:
> =C2=A0 - Updated YAML file
> =C2=A0=C2=A0=C2=A0 - Added "Acked-by: Conor Dooley <conor.dooley@microchi=
p.com>" for bindings.
> =C2=A0 - Updated driver file
> =C2=A0=C2=A0=C2=A0 - Added description for clk of eswin_calc_pll().
> =C2=A0=C2=A0=C2=A0 - Added macro EIC7700_MUX_TBL to manage mux clock-tree=
.
> =C2=A0=C2=A0=C2=A0 - Added eswin_clk_register_mux_tbl() to register mux c=
locks with
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 discontinuous parent indexes.
>=20
> =C2=A0 - Link to v6: https://lore.kernel.org/all/20251009092029.140-1-don=
gxuyang@eswincomputing.com/
>=20
> =C2=A0 Changes in v6:
> =C2=A0 - Removed config option patch dependency from cover letter, becaus=
e the patch
> =C2=A0=C2=A0=C2=A0 was applied.
> =C2=A0 - Updated YAML file
> =C2=A0=C2=A0=C2=A0 - Added an oscillator as the clock input, named xtal24=
m.
> =C2=A0=C2=A0=C2=A0 - Added clocks property.
> =C2=A0 - Updated driver file
> =C2=A0=C2=A0=C2=A0 - Replaced fixed_rate_clk_xtal_24m with xtal24m.
> =C2=A0=C2=A0=C2=A0 - Dropped fixed_rate_clk_xtal_24m from driver. Because=
 clock xtal24m was
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 registered by fixed-clock as oscillator.
>=20
> =C2=A0 - Link to v5: https://lore.kernel.org/all/20250923084637.1223-1-do=
ngxuyang@eswincomputing.com/
>=20
> =C2=A0 Changes in v5:
> =C2=A0 - Removed vendor prefix patch dependency from cover letter, becaus=
e the patch
> =C2=A0=C2=A0=C2=A0 was applied.
> =C2=A0 - Updated YAML file
> =C2=A0=C2=A0=C2=A0 - Placed the required after all properties.
> =C2=A0=C2=A0=C2=A0 - Removed patternProperties. Also removed compatible o=
f eswin,pll-clock,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 eswin,mux-clock, eswin,divider-clock and e=
swin,gate-clock as we have moved
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clock tree from DTS to Linux driver.
> =C2=A0=C2=A0=C2=A0 - Removed the clock tree from DTS. Used clock-controll=
er to manage all
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clock. Removed all child nodes in clock-co=
ntroller.
> =C2=A0=C2=A0=C2=A0 - Removed '#address-cells' and '#size-cells' propertie=
s, because the clock
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 controller did not need to define these pr=
operties.
> =C2=A0=C2=A0=C2=A0 - Removed eic7700-clocks.dtsi.
> =C2=A0=C2=A0=C2=A0 - Added dt-bindings header for clock IDs. Because used=
 the IDs to register
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks.
> =C2=A0 - Updated driver file
> =C2=A0=C2=A0=C2=A0 - Modified the commit for clock driver. Dropped indent=
ation in commit.
> =C2=A0=C2=A0=C2=A0 - Removed CLK_OF_DECLARE(). Used *clk_hw_register* to =
register clocks. Used
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 devm_of_clk_add_hw_provider.
> =C2=A0=C2=A0=C2=A0 - Dropped singletons.
> =C2=A0=C2=A0=C2=A0 - Checked the value right after obtaining it.
> =C2=A0=C2=A0=C2=A0 - Removed the definitions of macro frequency in clk.h =
like CLK_FREQ_24M.
> =C2=A0=C2=A0=C2=A0 - Modified description of help in Kconfig.
> =C2=A0=C2=A0=C2=A0 - Added COMPILE_TEST. Added COMMON_CLK_ESWIN for clk.o=
. And added
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "select COMMON_CLK_ESWIN" for clk-eic7700.=
c. Without COMMON_CLK_EIC7700,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clk.c could not be compiled.
> =C2=A0=C2=A0=C2=A0 - Used .determined_rate.
> =C2=A0=C2=A0=C2=A0 - Added macro definitions of EIC7700_DIV, EIC7700_FIXE=
D, EIC7700_FACTOR,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_MUX and EIC7700_PLL to manage cloc=
k tree.
> =C2=A0=C2=A0=C2=A0 - Added clk-eic7700.h to place eic7700 SoC clock regis=
ters.
> =C2=A0=C2=A0=C2=A0 - Removed refdiv_val and postdiv1_val from clk_pll_rec=
alc_rate(). Because
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 these values were unused.
>=20
> =C2=A0 - Link to v4: https://lore.kernel.org/all/20250815093539.975-1-don=
gxuyang@eswincomputing.com/
>=20
> =C2=A0 Changes in v4:
> =C2=A0 - Updated YAML file
> =C2=A0=C2=A0=C2=A0 - Changed name from cpu-default-frequency to cpu-defau=
lt-freq-hz.
> =C2=A0=C2=A0=C2=A0 - Dropped $ref of cpu-default-frequency.
> =C2=A0=C2=A0=C2=A0 - Added cpu-default-frequency for required.
> =C2=A0=C2=A0=C2=A0 - Removed cpu-default-frequency in updated file, becau=
se there was no
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 need to add cpu-default-frequency.
> =C2=A0=C2=A0=C2=A0 - Moved DIVIDER to DIV.
> =C2=A0=C2=A0=C2=A0 - Arranged the IDs in order.
> =C2=A0=C2=A0=C2=A0 - Dropped EIC7700_NR_CLKS.
> =C2=A0=C2=A0=C2=A0 - Removed dt-bindings eswin,eic7700-clock.h. Because I=
Ds was not used,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and used clock device nodes.
> =C2=A0=C2=A0=C2=A0 - According to the updated driver codes, the YAML has =
been updated.
> =C2=A0 - Updated driver file
> =C2=A0=C2=A0=C2=A0 - Remove undocumented parameters "cpu_no_boost_1_6ghz"=
 and
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "cpu-default-frequency".
> =C2=A0=C2=A0=C2=A0 - Modified the comment and used the correct Linux codi=
ng style.
> =C2=A0=C2=A0=C2=A0 - Removed codes of voltage, because it was not the clo=
ck driver.
> =C2=A0=C2=A0=C2=A0 - Updated the formula of clock frequency calculation. =
Removed the logic
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 that only used register selection.
> =C2=A0=C2=A0=C2=A0 - Used CLK_OF_DECLARE() to register clocks. Registered=
 pll-clock,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mux-clock, divider-clock, and gate-clock i=
n clk-eic7700.c.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The specific implementation of clock regis=
tration was in clk.c.
> =C2=A0=C2=A0=C2=A0 - Added eic7700-clocks.dtsi.
> =C2=A0=C2=A0=C2=A0 - Moved device information to DTS. Put all clocks' nod=
e in the
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 eic7700-clocks.dtsi.
>=20
> =C2=A0 - Link to v3: https://lore.kernel.org/all/20250624103212.287-1-don=
gxuyang@eswincomputing.com/
>=20
> =C2=A0 Changes in v3:
> =C2=A0 - Update example, drop child node and add '#clock-cells' to the pa=
rent
> =C2=A0=C2=A0=C2=A0 node.
> =C2=A0 - Change parent node from sys-crg to clock-controller for this yam=
l.
> =C2=A0 - Drop "syscon", "simple-mfd" to clear warnings/errors by using "m=
ake
> =C2=A0=C2=A0=C2=A0 dt_binding_check". And these are not necessary.
> =C2=A0 - Add "cpu-default-frequency" definition in yaml for "undocumented=
 ABI".
> =C2=A0 - Drop Reviewed-by, this is misunderstanding. We have not received=
 such
> =C2=A0=C2=A0=C2=A0 an email.
> =C2=A0 - Link to v2: https://lore.kernel.org/all/20250523090747.1830-1-do=
ngxuyang@eswincomputing.com/
>=20
> =C2=A0 Changes in v2:
> =C2=A0 - Update example, drop child node.
> =C2=A0 - Clear warnings/errors for using "make dt_binding_check".
> =C2=A0 - Change to the correct format.
> =C2=A0 - Drop some non-stanard code.
> =C2=A0 - Use dev_err_probe() in probe functions.
> =C2=A0 - Link to v1: https://lore.kernel.org/all/20250514002233.187-1-don=
gxuyang@eswincomputing.com/
>=20
> Xuyang Dong (4):
> =C2=A0 dt-bindings: clock: eswin: Documentation for eic7700 SoC
> =C2=A0 clk: divider: Add devm_clk_hw_register_divider_parent_data
> =C2=A0 clk: eswin: Add eic7700 clock driver
> =C2=A0 MAINTAINERS: Add entry for ESWIN EIC7700 clock driver
>=20
> =C2=A0.../bindings/clock/eswin,eic7700-clock.yaml=C2=A0=C2=A0 |=C2=A0=C2=
=A0 46 +
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0=C2=A0 8 +
> =C2=A0drivers/clk/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> =C2=A0drivers/clk/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> =C2=A0drivers/clk/eswin/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 15 +
> =C2=A0drivers/clk/eswin/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0=C2=A0 8 +
> =C2=A0drivers/clk/eswin/clk-eic7700.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1376 +++++++++++++++++
> =C2=A0drivers/clk/eswin/clk.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 588 +++++++
> =C2=A0drivers/clk/eswin/common.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 340 ++++
> =C2=A0.../dt-bindings/clock/eswin,eic7700-clock.h=C2=A0=C2=A0 |=C2=A0 285=
 ++++
> =C2=A0include/linux/clk-provider.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 20 +
> =C2=A011 files changed, 2688 insertions(+)
> =C2=A0create mode 100644 Documentation/devicetree/bindings/clock/eswin,ei=
c7700-clock.yaml
> =C2=A0create mode 100644 drivers/clk/eswin/Kconfig
> =C2=A0create mode 100644 drivers/clk/eswin/Makefile
> =C2=A0create mode 100644 drivers/clk/eswin/clk-eic7700.c
> =C2=A0create mode 100644 drivers/clk/eswin/clk.c
> =C2=A0create mode 100644 drivers/clk/eswin/common.h
> =C2=A0create mode 100644 include/dt-bindings/clock/eswin,eic7700-clock.h
>=20
> --
> 2.34.1
