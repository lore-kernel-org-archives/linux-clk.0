Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C46846521
	for <linux-clk@vger.kernel.org>; Thu, 30 May 2024 20:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717099963; cv=none; b=fxSKDxHx4P8mivC1kwAs/v5qIDPoXFoJ9NEDBjFVNBmL2WXvWoFhMJDd69XAf144+jSRX+uO5xnZBFnGxP6ZcgiCRRbgIKZm5TTfOvEZHIGP4DiuKWsahGB672Q3ZvSmgniBgnfoejwkpomHlR5ZlfyRFk+Lm6DEZGB6dwrRa2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717099963; c=relaxed/simple;
	bh=+8mnOtkeH9fcPI5/0e2c5cwqadw8gmoiGYpHngNzfbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OPG8Wkwk3HMJimIkfhFzZFSqJTKP6Qww118Ajqt394QeQfUf/uagu5M5pwRxVPQwRSY/M2bq9+bGbmfiU5dI3UvZ+lTXMbNcRb2W4Az6CE8P9hvE8BJwu3ioO2Qqy0eT314mchlurznd89Tx7LQmc2iVUayuVz4iklGSnSP3MOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PbOKIpWX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PbOKIpWX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717099960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=muyDpwslgzvSzhcZHj23jwcOsi3oF9m1bByqZFf5Dwg=;
	b=PbOKIpWXRp1oRTzS9jKDq9Wg2jhHgh6znrt6yWI2eYYiVzocdGZSJQBND1r8NnXVEPQhCR
	lyzifN8hn5DWeigGVyUb9xMx6aWZbUUqSOxCFACbmJmRnEIbUuLWuHHNRbfvjH+6daSO1K
	vc51lbhm8fcx2Hoch5INbQjCL026kd0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-DGHkysdBPxqOFQumhj4YgQ-1; Thu, 30 May 2024 16:12:34 -0400
X-MC-Unique: DGHkysdBPxqOFQumhj4YgQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA075800CAC;
	Thu, 30 May 2024 20:12:33 +0000 (UTC)
Received: from fedora (unknown [10.22.9.63])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D17B2027019;
	Thu, 30 May 2024 20:12:33 +0000 (UTC)
Date: Thu, 30 May 2024 16:12:32 -0400
From: Audra Mitchell <audra@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Donald Zickus <dzickus@redhat.com>, msalter@redhat.com,
	Nico Pache <npache@redhat.com>,
	KUnit Development <kunit-dev@googlegroups.com>,
	linux-clk@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
	Audra Mitchell <aubaker@redhat.com>
Subject: Re: [Bug Report] Multiple S390x KUNIT clk failures
Message-ID: <ZljdsG6nWo3Acw3Z@fedora>
References: <CAA1CXcBhABB60JG-sT1qRysD1AP+bN=wo=5vwbeTv13Gj72EzA@mail.gmail.com>
 <301cd41e6283c12ac67fb8c0f8d5c929.sboyd@kernel.org>
 <CAA1CXcALWqxfoWsv_wuiu-hAmX=AosvEedheGJUQHAhDCZf2Sg@mail.gmail.com>
 <9be47cd74b62ba8e4a36f3139fc8d275.sboyd@kernel.org>
 <CAK18DXZyEHZ=1TC52kQQ89gscFLph0e_4zB_bt=DTwR-A=0UPA@mail.gmail.com>
 <CAK18DXZ223RxeV7teXjBZ-0x5U8hdmgxxL9zew3aoR7SZvxEvQ@mail.gmail.com>
 <ZlZDR3xhZfK43njo@fedora>
 <7ee38bb411e20721c1d1ebdb0455a626885e1cb8.camel@redhat.com>
 <076c65b6247cc0ddbae792f8f414be89.sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <076c65b6247cc0ddbae792f8f414be89.sboyd@kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

On Wed, May 29, 2024 at 12:39:34PM -0700, Stephen Boyd wrote:
> Quoting msalter@redhat.com (2024-05-28 15:53:48)
> > On Tue, 2024-05-28 at 16:49 -0400, Audra Mitchell wrote:
> > > 
> > > I spent some time last week or so working on debugging these failures and I 
> > > believe I have found the problem. I reached out to Malk Salter for advice on 
> > > the best way to move forward with a fix on Friday the 17th, but he was on 
> > > PTO for the last week. I was waiting for his reply before I replied to this 
> > > thread. 
> > > 
> > > Also as a side note, I also ran into the same issue as Stephen with running
> > > the kunit tests on s390 QEMU. I did not pursue resolving that issue and
> > > instead just compiled the test as a module. 
> > > 
> > > For clarity, this is what I sent to Mark and were I believe the failure is
> > > occurring:
> > > 
> > > The tests create a pretend clk-gate and use a "fake_reg" to emulate
> > > the expected behavior of the clk_gate->reg. I added some debug
> > > statements to the driver and noticed that the reg changes after
> > > initialization to -1. I also noticed that we call this to read the
> > > data in the clk-gate->reg:
> > > 
> > > static inline u32 clk_gate_readl(struct clk_gate *gate)
> > > {
> > >         if (gate->flags & CLK_GATE_BIG_ENDIAN)
> > >                 return ioread32be(gate->reg);
> > > 
> > >         return readl(gate->reg);
> > > }
> > > 
> > > However, it does not look like ioread32be is defined for s390, so
> > 
> > It is defined. arch/s390/include/asm/io.h defines:
> > 
> >    #define __raw_readl  zpci_read_u32
> > 
> > and then includes include/asm-generic/io.h which has:
> > 
> > static inline u32 readl(const volatile void __iomem *addr)
> > {
> >         u32 val;
> > 
> >         log_read_mmio(32, addr, _THIS_IP_, _RET_IP_);
> >         __io_br();
> >         val = __le32_to_cpu((__le32 __force)__raw_readl(addr));
> >         __io_ar(val);
> >         log_post_read_mmio(val, 32, addr, _THIS_IP_, _RET_IP_);
> >         return val;
> > }
> > ...
> > static inline u32 ioread32be(const volatile void __iomem *addr)
> > {
> >         return swab32(readl(addr));
> > }
> > 
> > which should do the right thing (s390 being BE and readl() is for 32-bit LE reads).
> > 
> > But I don't know the s390 compiler or ISA, so I'm not sure where the zpci_load
> > is coming from.
> > 
> 
> So the problem is that the zpci_read_u32() fails and returns -1?
> 
> This test isn't the best because it uses fakes iomem and architectures
> may not like that. We really need to implement something in KUnit core
> to allocate a fake iomem region and then plumb that through all the
> architectures so that the iomem functions like readl, writel, etc. go a
> different direction when the pointer is for the fake region.
> 
> Probably the best thing to do in the short term here is to prevent this
> test from running on S390 via Kconfig.


Hey Stephen, thanks a bunch for looking at this. I do not have a lot of
experience with s390 to vote one way or another for how best to approach
resolving this problem.

By the way zpci_load is coming from here:

readl calls __raw_readl
s390 defines raw_readl as zpci_read_u32:

  #define __raw_readl     zpci_read_u32

And zpci_read is defined here, which then calls zpci_load:

  #define zpci_read(LENGTH, RETTYPE)                                              \
  static inline RETTYPE zpci_read_##RETTYPE(const volatile void __iomem *addr)    \
  {                                                                               \
          u64 data;                                                               \
          int rc;                                                                 \
                                                                                \
          rc = zpci_load(&data, addr, LENGTH);                                    \
          if (rc)                                                                 \
                  data = -1ULL;                                                   \
          return (RETTYPE) data;                                                  \
  }

Thanks again!




