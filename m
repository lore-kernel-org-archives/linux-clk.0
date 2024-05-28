Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C801F8F49
	for <linux-clk@vger.kernel.org>; Tue, 28 May 2024 22:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716936835; cv=none; b=NhpWc9KAfjSljuyniGKxtzCV//3rdqVOGpt6nAiX4M/mjWFMv5E6iyjmd+2vkOJBy0b8uLY3FGD2G51YNqp8TDrFHqw6Vy3EK3EaGWb6OJX1pIlvxRc5kp7ffv2KjgAirnEzOz+W/t3esEwE9bER+bfyu0TngxhHbqh06UbbH6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716936835; c=relaxed/simple;
	bh=ocqWPlFmB30kgxIlQd5TuyKj92tLhibiFUZRYtid/7I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GmcHSBckDWYBefxnfd9rx77jIEsEXUie2qs3vJEMNdYRGy/t2lxOymKvSp/Kkutwhni/+LPyRXY2zRhQIqoNIQDLLVbMvT4aixf2zV9AHDiE/M3uzHE8WdfHhGmroUA5mI90OGBf6iS2Wn4n219WvhSAJgOeqG3wlzK4wAZxfTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tpm1kUAj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tpm1kUAj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716936832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Q7RQf49zpWwx7i+nCZ9yz1iBmFIRy2u2WjEd7dfsQHE=;
	b=Tpm1kUAjgmxY0NT9KowJGJSf3noWYKq6Hl27DtP0DJ0zt5GrBIQWbPNOqRAaBbsbYKzaCD
	jnI7CuvP4DPm/WC8kyRNPZcZA9fPsXi46b/rJdyGFqwf4Q1E8zhJU7JrCH1+QUycLjRNlX
	aUIvJPDK9tSzO6oZRqXtQOnHZ33yD8A=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-TAvQwEivNRyLQh3KbwLuVg-1; Tue, 28 May 2024 18:53:51 -0400
X-MC-Unique: TAvQwEivNRyLQh3KbwLuVg-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-62a3dec382eso3518957b3.1
        for <linux-clk@vger.kernel.org>; Tue, 28 May 2024 15:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716936831; x=1717541631;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7RQf49zpWwx7i+nCZ9yz1iBmFIRy2u2WjEd7dfsQHE=;
        b=da2uWey6ofjU336ZBiarirovfVcQc9xZ0orLzkSssdjLbeSZ3uy5BioKSClNz2KmEU
         oVvs0KUYAhLaQYkA9TM7q9ruzAx25R+srfI81hNRY1niHdiWTb093UBLKdauPQ18zXuJ
         YzQ3iUbZEeslz+Cs8TIOo0SjROH9G5eGJh8UOvKhufxJJZjZUGw7ecgESBgBdrQCCEOi
         umUKFJ+aB32xFMMU5naFGJhhmzaDNb2GOuWi4gn3U8Q/SzSLc8Y1rVE+e1AWDuKb8waw
         fdWEtECASNpNfS7N2g9DPNGVy5glOS+aRdGgau/dNXyLzsx7CsnENSLw1SLnJjTPrseG
         b9jQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvCdjYVH9k2eqh+H6LFZyWCdZViYo8El+BAr+z1zhLzN/0wKekQM68Wg0yMoY+e+Gdr7jQ04W7dLexHEM+O/G5eVeHaNP4ewrJ
X-Gm-Message-State: AOJu0YwpaknYlccLFsnNMFuyVRVrrpQn98uBrZbXP4WfT3jWik0j8UvB
	rP7yykW0vPOHSPqn7Sx2HwZ+TAtMi5QVNsWRrIZcwCfPo6NpBKxvrYdPZoaE7LpBbvtUWP2P1fW
	r8EkLyeadDibzP9P2Wzpn6qvbKYPc7aVUMWL0al91X4HoVMw0qEh2fW7NaA==
X-Received: by 2002:a0d:cb43:0:b0:61b:1792:3ecd with SMTP id 00721157ae682-62c5d2aab7fmr3459927b3.6.1716936830504;
        Tue, 28 May 2024 15:53:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWg6yo3KtKS5KsPLF82+3Dq+wXuBiyRmrgVW4FOwb5OGNtvyfj7vaR8XpOA7oc4rswgEf03g==
X-Received: by 2002:a0d:cb43:0:b0:61b:1792:3ecd with SMTP id 00721157ae682-62c5d2aab7fmr3459777b3.6.1716936829877;
        Tue, 28 May 2024 15:53:49 -0700 (PDT)
Received: from trippy.localdomain ([165.166.225.4])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62a0a37c66asm22644607b3.11.2024.05.28.15.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 15:53:49 -0700 (PDT)
Message-ID: <7ee38bb411e20721c1d1ebdb0455a626885e1cb8.camel@redhat.com>
Subject: Re: [Bug Report] Multiple S390x KUNIT clk failures
From: msalter@redhat.com
To: Audra Mitchell <audra@redhat.com>, Donald Zickus <dzickus@redhat.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Nico Pache <npache@redhat.com>, KUnit
 Development <kunit-dev@googlegroups.com>, linux-clk@vger.kernel.org, Shuah
 Khan <skhan@linuxfoundation.org>,  Audra Mitchell <aubaker@redhat.com>
Date: Tue, 28 May 2024 18:53:48 -0400
In-Reply-To: <ZlZDR3xhZfK43njo@fedora>
References: 
	<CAA1CXcBhABB60JG-sT1qRysD1AP+bN=wo=5vwbeTv13Gj72EzA@mail.gmail.com>
	 <301cd41e6283c12ac67fb8c0f8d5c929.sboyd@kernel.org>
	 <CAA1CXcALWqxfoWsv_wuiu-hAmX=AosvEedheGJUQHAhDCZf2Sg@mail.gmail.com>
	 <9be47cd74b62ba8e4a36f3139fc8d275.sboyd@kernel.org>
	 <CAK18DXZyEHZ=1TC52kQQ89gscFLph0e_4zB_bt=DTwR-A=0UPA@mail.gmail.com>
	 <CAK18DXZ223RxeV7teXjBZ-0x5U8hdmgxxL9zew3aoR7SZvxEvQ@mail.gmail.com>
	 <ZlZDR3xhZfK43njo@fedora>
Autocrypt: addr=msalter@redhat.com; prefer-encrypt=mutual; keydata=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
 FuSXUwlZXKVXeK1Jti3U=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2024-05-28 at 16:49 -0400, Audra Mitchell wrote:
> On Tue, May 28, 2024 at 02:49:56PM -0400, Donald Zickus wrote:
> > (trying again without the html part that gmail likes to add.=C2=A0 Apol=
ogies)
> >=20
> > On Tue, May 28, 2024 at 2:45=E2=80=AFPM Donald Zickus <dzickus@redhat.c=
om> wrote:
> > >=20
> > > Hi Stephen,
> > >=20
> > > On Tue, May 14, 2024 at 6:04=E2=80=AFPM Stephen Boyd <sboyd@kernel.or=
g> wrote:
> > > >=20
> > > > Quoting Nico Pache (2024-05-14 00:14:24)
> > > > > Hi Stephen,
> > > > >=20
> > > > > Yes, we have that commit. This is failing on fedora-ark, so it's
> > > > > constantly updated to match upstream, and the earliest recorded
> > > > > instance of it failing in our environment is v6.1.
> > > > >=20
> > > >=20
> > > > Please don't top post. I'm unable to run s390 kunit tests in qemu. =
They
> > > > seem to crash before finishing.
> > >=20
> > >=20
> > > I am working with Nico on moving this forward.=C2=A0 What can we do t=
o help resolve this?
>=20
> Hello all,
>=20
> I spent some time last week or so working on debugging these failures and=
 I=20
> believe I have found the problem. I reached out to Malk Salter for advice=
 on=20
> the best way to move forward with a fix on Friday the 17th, but he was on=
=20
> PTO for the last week. I was waiting for his reply before I replied to th=
is=20
> thread.=20
>=20
> Also as a side note, I also ran into the same issue as Stephen with runni=
ng
> the kunit tests on s390 QEMU. I did not pursue resolving that issue and
> instead just compiled the test as a module.=20
>=20
> For clarity, this is what I sent to Mark and were I believe the failure i=
s
> occurring:
>=20
> The tests create a pretend clk-gate and use a "fake_reg" to emulate
> the expected behavior of the clk_gate->reg. I added some debug
> statements to the driver and noticed that the reg changes after
> initialization to -1. I also noticed that we call this to read the
> data in the clk-gate->reg:
>=20
> static inline u32 clk_gate_readl(struct clk_gate *gate)
> {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (gate->flags & CLK_GATE_BIG=
_ENDIAN)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return ioread32be(gate->reg);
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return readl(gate->reg);
> }
>=20
> However, it does not look like ioread32be is defined for s390, so

It is defined. arch/s390/include/asm/io.h defines:

   #define __raw_readl	zpci_read_u32

and then includes include/asm-generic/io.h which has:

static inline u32 readl(const volatile void __iomem *addr)
{
	u32 val;

	log_read_mmio(32, addr, _THIS_IP_, _RET_IP_);
	__io_br();
	val =3D __le32_to_cpu((__le32 __force)__raw_readl(addr));
	__io_ar(val);
	log_post_read_mmio(val, 32, addr, _THIS_IP_, _RET_IP_);
	return val;
}
...
static inline u32 ioread32be(const volatile void __iomem *addr)
{
	return swab32(readl(addr));
}

which should do the right thing (s390 being BE and readl() is for 32-bit LE=
 reads).

But I don't know the s390 compiler or ISA, so I'm not sure where the zpci_l=
oad
is coming from.

  =20
> instead the compiler uses read1 (which becomes zpci_load). I checked
> this by dumping the assembler of the compiled kunit clk-gate_test:
>=20
> /root/linux/drivers/clk/clk-gate.c: 29
> 0x13214c9c6 <clk_gate_is_enabled+38>:=C2=A0=C2=A0 tm=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 33(%r2),4
> 0x13214c9ca <clk_gate_is_enabled+42>:=C2=A0=C2=A0 jne=C2=A0=C2=A0=C2=A0=
=C2=A0 0x13214ca82
> <clk_gate_is_enabled+226>
> /root/linux/./arch/s390/include/asm/pci_io.h: 64
> 0x13214c9ce <clk_gate_is_enabled+46>:=C2=A0=C2=A0 lghi=C2=A0=C2=A0=C2=A0 =
%r4,4
> 0x13214c9d2 <clk_gate_is_enabled+50>:=C2=A0=C2=A0 la=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 %r2,160(%r15)
> 0x13214c9d6 <clk_gate_is_enabled+54>:=C2=A0=C2=A0 brasl=C2=A0=C2=A0 %r14,=
0x131bbc3f0 <zpci_load>
> 0x13214c9dc <clk_gate_is_enabled+60>:=C2=A0=C2=A0 cije=C2=A0=C2=A0=C2=A0 =
%r2,0,0x13214ca78
> <clk_gate_is_enabled+216>
>=20
> Following up on this, I noticed that if the zpci_load is not
> successful, we will return a -1:
>=20
> static inline RETTYPE zpci_read_##RETTYPE(const volatile void __iomem
> *addr)=C2=A0=C2=A0=C2=A0 \
> {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 data;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int rc;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D zpci_load(&data, addr, =
LENGTH);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (rc)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 data =3D -1ULL;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return (RETTYPE) data;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> }
>=20
>=20
> All this to say, I'm not sure the best way to resolve this problem. We
> need to patch clk_gate_readl() but I am not sure the best way to go
> about doing this for big_endian systems.
>=20
> Any recommedations on the best way to resolve this problem is welcomed!
>=20
> Thanks in advance!
>=20
> -- Audra Mitchell
>=20
>=20
> > >=20
> > > Cheers,
> > > Don
> > >=20
> > > >=20
> > > >=20
> > > > =C2=A0./tools/testing/kunit/kunit.py run --kunitconfig=3Dlib/kunit =
--arch=3Ds390 --cross_compile=3D/path/to/s390-linux-
> > > >=20
> > > > [14:55:10] Starting KUnit Kernel (1/1)...
> > > > [14:55:10] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > Running tests with:
> > > > $ qemu-system-s390x -nodefaults -m 1024 -kernel .kunit/arch/s390/bo=
ot/bzImage -append 'kunit.enable=3D1 console=3DttyS0 kunit_shutdown=3Dreboo=
t' -no-reboot
> > > > -nographic -serial stdio -machine s390-ccw-virtio -cpu qemu
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D exam=
ple_init (1 subtest) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [14:55:11] [PASSED] example_init_test
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [=
PASSED] example_init =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D kunit_executor_t=
est (8 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [14:55:11] [PASSED] parse_filter_test
> > > > [14:55:11] [PASSED] filter_suites_test
> > > > [14:55:11] [PASSED] filter_suites_test_glob_test
> > > > [14:55:11] [PASSED] filter_suites_to_empty_test
> > > > [14:55:11] [PASSED] parse_filter_attr_test
> > > > [14:55:11] [PASSED] filter_attr_test
> > > > [14:55:11] [PASSED] filter_attr_empty_test
> > > > [14:55:11] [PASSED] filter_attr_skip_test
> > > > [14:55:11] [ERROR] Test: kunit_executor_test: Expected test number =
1 but found 2
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] k=
unit_executor_test =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D kunit-try-catch-tes=
t (2 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [14:55:11] [PASSED] kunit_test_try_catch_successful_try_no_catch
> > > > [14:55:11] [PASSED] kunit_test_try_catch_unsuccessful_try_does_catc=
h
> > > > [14:55:11] [ERROR] Test: kunit-try-catch-test: Expected test number=
 1 but found 3
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] kuni=
t-try-catch-test =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D kunit-resource-test=
 (12 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [14:55:11] [PASSED] kunit_resource_test_init_resources
> > > > [14:55:11] [PASSED] kunit_resource_test_alloc_resource
> > > > [14:55:11] [PASSED] kunit_resource_test_destroy_resource
> > > > [14:55:11] [PASSED] kunit_resource_test_remove_resource
> > > > [14:55:11] [PASSED] kunit_resource_test_cleanup_resources
> > > > [14:55:11] [PASSED] kunit_resource_test_proper_free_ordering
> > > > [14:55:11] [PASSED] kunit_resource_test_static
> > > > [14:55:11] [PASSED] kunit_resource_test_named
> > > > [14:55:11] [PASSED] kunit_resource_test_action
> > > > [14:55:11] [PASSED] kunit_resource_test_remove_action
> > > > [14:55:11] [PASSED] kunit_resource_test_release_action
> > > > [14:55:11] [PASSED] kunit_resource_test_action_ordering
> > > > [14:55:11] [ERROR] Test: kunit-resource-test: Expected test number =
1 but found 4
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] k=
unit-resource-test =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D kunit-log-=
test (2 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [14:55:11] [PASSED] kunit_log_test
> > > > [14:55:11] [SKIPPED] kunit_log_newline_test
> > > > [14:55:11] [ERROR] Test: kunit-log-test: Expected test number 1 but=
 found 5
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PAS=
SED] kunit-log-test =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D kunit_s=
tatus (2 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [14:55:11] [PASSED] kunit_status_set_failure_test
> > > > [14:55:11] [PASSED] kunit_status_mark_skipped_test
> > > > [14:55:11] [ERROR] Test: kunit_status: Expected test number 1 but f=
ound 6
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [=
PASSED] kunit_status =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D kunit_c=
urrent (2 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [14:55:11] [PASSED] kunit_current_test
> > > > [14:55:11] [PASSED] kunit_current_fail_test
> > > > [14:55:11] [ERROR] Test: kunit_current: Expected test number 1 but =
found 7
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [=
PASSED] kunit_current =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D kunit_d=
evice (3 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [14:55:11] [PASSED] kunit_device_test
> > > > [14:55:11] [PASSED] kunit_device_cleanup_test
> > > > [14:55:11] [PASSED] kunit_device_driver_test
> > > > [14:55:11] [ERROR] Test: kunit_device: Expected test number 1 but f=
ound 8
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [=
PASSED] kunit_device =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D string-stream-te=
st (12 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [14:55:11] [PASSED] string_stream_managed_init_test
> > > > [14:55:11] [PASSED] string_stream_unmanaged_init_test
> > > > [14:55:11] [PASSED] string_stream_managed_free_test
> > > > [14:55:11] [PASSED] string_stream_resource_free_test
> > > > [14:55:11] [PASSED] string_stream_line_add_test
> > > > [14:55:11] [PASSED] string_stream_variable_length_line_test
> > > > [14:55:11] [PASSED] string_stream_append_test
> > > > [14:55:11] [PASSED] string_stream_append_auto_newline_test
> > > > [14:55:11] [PASSED] string_stream_append_empty_string_test
> > > > [14:55:11] [PASSED] string_stream_no_auto_newline_test
> > > > [14:55:11] [PASSED] string_stream_auto_newline_test
> > > > [14:55:11] [PASSED] string_stream_performance_test
> > > > [14:55:11] [ERROR] Test: string-stream-test: Expected test number 1=
 but found 9
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] s=
tring-stream-test =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D example (9 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > > > [14:55:11] [PASSED] example_simple_test
> > > > [14:55:11] [SKIPPED] example_skip_test
> > > > [14:55:11] [ERROR] Test: example: missing expected subtest!
> > > > [14:55:11]
> > > > [14:55:11] # example_mark_skipped_test: initializing
> > > > [14:55:11]
> > > > [14:55:11] # example_mark_skipped_test: You should see a line below=
.
> > > > [14:55:11] [CRASHED]
> > > > [14:55:11] [ERROR] Test: example: missing expected subtest!
> > > > [14:55:11] [CRASHED]
> > > > [14:55:11] [ERROR] Test: example: missing expected subtest!
> > > > [14:55:11] [CRASHED]
> > > > [14:55:11] [ERROR] Test: example: missing expected subtest!
> > > > [14:55:11] [CRASHED]
> > > > [14:55:11] [ERROR] Test: example: missing expected subtest!
> > > > [14:55:11] [CRASHED]
> > > > [14:55:11] [ERROR] Test: example: missing expected subtest!
> > > > [14:55:11] [CRASHED]
> > > > [14:55:11] [ERROR] Test: example: missing expected subtest!
> > > > [14:55:11] [CRASHED]
> > > > [14:55:11] [ERROR] Test: example: missing subtest result line!
> > > > [14:55:11]
> > > > [14:55:11] # module: kunit_example_test
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D [CRASHED] example =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > > > [14:55:11]
> > > > [14:55:11] # example: initializing suite
> > > > [14:55:11]
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D [CRASHED]=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [14:55:11]
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D [CRASHED]=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [14:55:11]
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D [CRASHED]=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [14:55:11]
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D [CRASHED]=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [14:55:11]
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D [CRASHED]=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [14:55:11]
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D [CRASHED]=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [14:55:11]
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D [CRASHED]=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [14:55:11]
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D [CRASHED]=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [14:55:11]
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D [CRASHED]=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [14:55:11]
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D [CRASHED]=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [14:55:11] [ERROR] Test: main: missing expected subtest!
> > > > [14:55:11] [CRASHED]
> > > > [14:55:11] [ERROR] Test: main: missing expected subtest!
> > > > [14:55:11] [CRASHED]
> > > > [14:55:11] [ERROR] Test: main: missing expected subtest!
> > > > [14:55:11] [CRASHED]
> > > > [14:55:11] [ERROR] Test: main: missing expected subtest!
> > > > [14:55:11] [CRASHED]
> > > > [14:55:11] [ERROR] Test: main: missing expected subtest!
> > > > [14:55:11] [CRASHED]
> > > > [14:55:11] [ERROR] Test: main: missing expected subtest!
> > > > [14:55:11] [CRASHED]
> > > > [14:55:11] [ERROR] Test: main: missing expected subtest!
> > > > [14:55:11] [CRASHED]
> > > > [14:55:11] [ERROR] Test: main: missing expected subtest!
> > > > [14:55:11] [CRASHED]
> > > > [14:55:11] [ERROR] Test: main: missing expected subtest!
> > > > [14:55:11] [CRASHED]
> > > > [14:55:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [14:55:11] Testing complete. Ran 62 tests: passed: 44, crashed: 16,=
 skipped: 2, errors: 25
> > > > The kernel seems to have crashed; you can decode the stack traces w=
ith:
> > > > $ scripts/decode_stacktrace.sh .kunit/vmlinux .kunit < .kunit/test.=
log | tee .kunit/decoded.log | ./tools/testing/kunit/kunit.py parse
> > > > [14:55:11] Elapsed time: 16.240s total, 1.476s configuring, 14.294s=
 building, 0.469s running
> > > >=20
> > > > I wonder if something with my local environment is causing troubles=
.
> > > >=20
>=20

