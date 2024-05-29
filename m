Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4A415B573
	for <linux-clk@vger.kernel.org>; Wed, 29 May 2024 19:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717011576; cv=none; b=NdaVieiy5fEus/lO6D6S43iGKj784+agoI8f1kaPS8u9VV9pmyWw3EkdBWeiosmVOUuAinWuEFdpR84x7qghxt6Ku5O9yvrbtaUbNINKM80LZgWs/njNhxG2JP8yhzPErp2V7ffH/2IEwLUtMtu0aNnLZlE+nC+/S+yL4digzqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717011576; c=relaxed/simple;
	bh=kFngJ3pvcfUWP4Hb9hvRDsiQ/EOy0oFMw4XLRz/vzw4=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=ZV8JqfTJl+8baIrYaHrd2Fj1NbIfDPmbtbKoj/L0E0/Ix08EHJPBLWfQkZYqS6uw7YL9vnwAzLszl8AhXFaZsODOecnP9bubqcWFr54dkvP76P/Y8H/WBuzT/gqTpwMzCkgJtFR7msw6Wlq80Ptn3R85dsWD1vOBZ+40zG7SQb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mwbsvv9k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mwbsvv9k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A2F8C113CC;
	Wed, 29 May 2024 19:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717011576;
	bh=kFngJ3pvcfUWP4Hb9hvRDsiQ/EOy0oFMw4XLRz/vzw4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=mwbsvv9kcZsL9asVelJkc0q0v917FcXHVac/Fo2Pznv1pri4B1bC9hYbfSiyGjCGv
	 h2LL/0zjxkSf+XZBcwEkuCq9DP4q2NOFWOygrs7r9JwVpvTuQOe4LMSqdRvX3YWqAi
	 Wu/jVu0jFBYSwPa4rgKhv1EmpW+GyKF9z2qS8IvisWgryzC/rZaGzQzhn9tI5NO+Z8
	 6FFBpABeV1zpv4/eD08KEcs+RFt++JVbTH8F5H7XI5y2ujMLu6McOXkXHk3i1r2KRu
	 GxyHFMThGqwHF1nhRNQGfGWDisjXzvNJynkoUhQjugeA5c3eTW7ZGhHoNrLWvfTpg1
	 eWDof4C+HffhQ==
Message-ID: <076c65b6247cc0ddbae792f8f414be89.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <7ee38bb411e20721c1d1ebdb0455a626885e1cb8.camel@redhat.com>
References: <CAA1CXcBhABB60JG-sT1qRysD1AP+bN=wo=5vwbeTv13Gj72EzA@mail.gmail.com> <301cd41e6283c12ac67fb8c0f8d5c929.sboyd@kernel.org> <CAA1CXcALWqxfoWsv_wuiu-hAmX=AosvEedheGJUQHAhDCZf2Sg@mail.gmail.com> <9be47cd74b62ba8e4a36f3139fc8d275.sboyd@kernel.org> <CAK18DXZyEHZ=1TC52kQQ89gscFLph0e_4zB_bt=DTwR-A=0UPA@mail.gmail.com> <CAK18DXZ223RxeV7teXjBZ-0x5U8hdmgxxL9zew3aoR7SZvxEvQ@mail.gmail.com> <ZlZDR3xhZfK43njo@fedora> <7ee38bb411e20721c1d1ebdb0455a626885e1cb8.camel@redhat.com>
Subject: Re: [Bug Report] Multiple S390x KUNIT clk failures
From: Stephen Boyd <sboyd@kernel.org>
Cc: Nico Pache <npache@redhat.com>, KUnit Development <kunit-dev@googlegroups.com>, linux-clk@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, Audra Mitchell <aubaker@redhat.com>
To: Audra Mitchell <audra@redhat.com>, Donald Zickus <dzickus@redhat.com>, msalter@redhat.com
Date: Wed, 29 May 2024 12:39:34 -0700
User-Agent: alot/0.10

Quoting msalter@redhat.com (2024-05-28 15:53:48)
> On Tue, 2024-05-28 at 16:49 -0400, Audra Mitchell wrote:
> >=20
> > I spent some time last week or so working on debugging these failures a=
nd I=20
> > believe I have found the problem. I reached out to Malk Salter for advi=
ce on=20
> > the best way to move forward with a fix on Friday the 17th, but he was =
on=20
> > PTO for the last week. I was waiting for his reply before I replied to =
this=20
> > thread.=20
> >=20
> > Also as a side note, I also ran into the same issue as Stephen with run=
ning
> > the kunit tests on s390 QEMU. I did not pursue resolving that issue and
> > instead just compiled the test as a module.=20
> >=20
> > For clarity, this is what I sent to Mark and were I believe the failure=
 is
> > occurring:
> >=20
> > The tests create a pretend clk-gate and use a "fake_reg" to emulate
> > the expected behavior of the clk_gate->reg. I added some debug
> > statements to the driver and noticed that the reg changes after
> > initialization to -1. I also noticed that we call this to read the
> > data in the clk-gate->reg:
> >=20
> > static inline u32 clk_gate_readl(struct clk_gate *gate)
> > {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (gate->flags & CLK_GATE_B=
IG_ENDIAN)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return ioread32be(gate->reg);
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return readl(gate->reg);
> > }
> >=20
> > However, it does not look like ioread32be is defined for s390, so
>=20
> It is defined. arch/s390/include/asm/io.h defines:
>=20
>    #define __raw_readl  zpci_read_u32
>=20
> and then includes include/asm-generic/io.h which has:
>=20
> static inline u32 readl(const volatile void __iomem *addr)
> {
>         u32 val;
>=20
>         log_read_mmio(32, addr, _THIS_IP_, _RET_IP_);
>         __io_br();
>         val =3D __le32_to_cpu((__le32 __force)__raw_readl(addr));
>         __io_ar(val);
>         log_post_read_mmio(val, 32, addr, _THIS_IP_, _RET_IP_);
>         return val;
> }
> ...
> static inline u32 ioread32be(const volatile void __iomem *addr)
> {
>         return swab32(readl(addr));
> }
>=20
> which should do the right thing (s390 being BE and readl() is for 32-bit =
LE reads).
>=20
> But I don't know the s390 compiler or ISA, so I'm not sure where the zpci=
_load
> is coming from.
>=20

So the problem is that the zpci_read_u32() fails and returns -1?

This test isn't the best because it uses fakes iomem and architectures
may not like that. We really need to implement something in KUnit core
to allocate a fake iomem region and then plumb that through all the
architectures so that the iomem functions like readl, writel, etc. go a
different direction when the pointer is for the fake region.

Probably the best thing to do in the short term here is to prevent this
test from running on S390 via Kconfig.
