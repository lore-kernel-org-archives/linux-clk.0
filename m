Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794282308;
	b=Md/M+fOTvb1eQwqvM8NhCE9iDKG3bZS7k2XbhiB+POiE1XlDZNTlSxGPreZe43n27bi3
	 VqcHmDIc1Zf/fECjdG2xPh8NRFCO5mDNh+1SY5wkee2ye4TAc9KUisfHaZ9GOr2zrmokO
	 ipjyWQ2qy5je8G1dOuTf+2OjMpurXN9iRiVXSA+LsY40p2J7xkNHRPLw/ctpUo8MdPcH5
	 aQEFOoWi0/2xwFz1udh1tNCvhZvDEW5JAOoEgsy5KqyVHQyURR/AgWEErTIMYuepfS7m9
	 XFdRkyJcd8k+pXF1E+zHT9bn7on8rYKxQqLCIMTOXYlcomSQGvDSYSUZc0EcjqbuY+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794282308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4mDyPcBarqrkxPjTC16S8+UW/cTA1USsfs9afFvxLu4=;
	b=DLCnmPMDN7iyT9MUK1ti3baEUbet4Gp4kKe+8uqLmsHUx9Eh5Ba+9giSofUy132w/te3
	 IeIH71VF/UGO6PGL5VI11idZT40QWZJCoEMq8vAtiW/WdXVNuK+sDrfBPQ9DeuYrpJ7Yz
	 +IJm1hi9/aTKIma0ilC+JGk5NAqkfrbB3KbmZySsMUawNF3hVuPWPf1RAi4k4h0Kn1cqg
	 DaNioGdfdjl1VLQ9E6rOdiJM1+0CskUlDkik0ZRxzqy0U9gVbU1vIOx4ycUqhwfQ/rB/L
	 1c3qwTNNN3XCeOQAE2FTDAfYTpZ+RQtzDPpF2B6Dek4EmUVfTYvFJgdtQPsuIFpxYrA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=mjYLkLzY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77626606A32A
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 03:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77626606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=mjYLkLzY
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1314580f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 19:45:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794282306; cv=none;
        d=google.com; s=arc-20260327;
        b=XSoHCA5LJSKMXeF+gHqmk0B3xCu4RiTkUWNHJ8ZNPIWJehnf7Ue9aDhpNUEGC2yv+g
         4NqMlQUpu1Obxb5yysjVDD5hSw1FVPyWAtCXq7gkXAgF20K4fn0oNKDV/tD//mr9lzyT
         K/gn2kQW1jI1Sz6sIHoGbt0O3/qUa6Fn68comgkAn55nt7edqolrbACZyYTLSz6JbJJf
         kekLVjDVlk2Fy3Q0rmFHEC149wLPRL6yDV5ZevQgIpqu+LTZ+6KH/zl2wRTkbgZFEPFS
         OUHFiYPj6akggLe8VD/dIrNjIPooKCNQHuy85GEFJLh6uomrGVEcySKfsOK5aPvwwm4b
         B7Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4mDyPcBarqrkxPjTC16S8+UW/cTA1USsfs9afFvxLu4=;
        fh=96BltWQZPhoy6P+S/tyVe24lQuVjhvU4hjV52V+DmYU=;
        b=sI9LG49VDW03z3iifC7dGKPxNMatofW+9JyTkBeBMa90oTBcisDRvATYJxDeTLCSnF
         ggSd41vR3QMYSuQA5/i+kVd2fRWpS27MAVprcNWMIesygV5YLH8uxueNtNiJBD48z1uO
         JTpDza02Z+UvelMgDkCNBye+publLVQ3qUMCKXMf87XZjMzJ2vt4IZpkoWs/drtUKDTc
         Sxb7u8fdcamm3fjRHj1yctag58QuBAItHK2QVYL0ugO6Pm1iA05XL46H3c+3MOq0axm5
         WQnpK5afsq1ioJLDgSA5HjERtsZjfgh8TxKlsTZ60dibIzpwfr6qGRV3xR+sICUEuOg7
         cGPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794282306; x=1794887106; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4mDyPcBarqrkxPjTC16S8+UW/cTA1USsfs9afFvxLu4=;
        b=mjYLkLzYX2TSXfhZ2DiPIY0QpyUYlx5rNWrWdFVQusHG+cIag5kMJ77PSnY/euUotE
         HCQwkPdOV3OsexUXEBUH34v/4AclRup6LqUrCFw2DDGSKYZGC+CMem3GBmHr+SW2XK38
         NS5vbwl2lX9w+BbHEgHUKshmYx0TQZD+9uwNIH2eklCVVOZHOGWoCvqscog2iUgogBYw
         wguOH5VSZ+fJzYFW6wYMO/hQavGSkXZXXjjTHllWwuTkdfJU6mndKvy84X7IUid/58mb
         OomA9xbwP0Q/5NgHCvLKq49R7WvMetKA+kwV+LmJyhEBLqReF9ZL68txdrLnkgDtSm5w
         Ta7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794282306; x=1794887106;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4mDyPcBarqrkxPjTC16S8+UW/cTA1USsfs9afFvxLu4=;
        b=jgbufh5e9iC6d3S1A1yBKvZ/uytFQZSAG2akRTXAZzF9WTB66hGf7N7HERIw2BLXks
         a0DZIOcTtKvvGW45Dsjqz73g4x1Ipd854BCxRpw9yfcT0q+RZ4ClZE+KDt7oIWaGUezB
         FqihptZ1da6MiFTharFCkHWDLyyH7RVDRgllNJRVUDokXtPXkso0E41cGi9vPaqrSb6P
         mMKYRxjsZG+GijzcOOvsSqhJ5/fJPY0T8xJHIZTN3L6W+rh5ADazsOPmDRNp/fa8y9eE
         ScGYmMeEJfuzZIrROEQTRfhzyN9/2pQdRP+dWaUOmAOQ4yopLvCdY+LmYSCzG/P0Par4
         sMFg==
X-Forwarded-Encrypted: i=1; AL+hErGjP7HgeMnm02EjCbZ5bEDyyOodR9ePvi2fAFofCY8BwSpPWPZwOIi433Sfd6EtljTeZ3hf2Xc/uHc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eYWcqqv5Q/mbI++Mm4eL7q6IlmqK8eVirDd2nQb/Zid8SKwE/
	tg95Zxr9zodS3KH3pweb3D6JyS+2PGFiivPsqhWJvEViJJNyRxSLLUnvXecLYtK6L0q1crlkwA+
	PCJrAyv1kyUmqYHlwH6JEGW+WvcWhFCY0pZ/zrZ3lWQ==
X-Gm-Gg: AYBFou2LZxuvNO9M2a9JRGN25Ojh8CGDRqyCRPnfSH6jOc/i+/J8sFyLcL2dPbvyfkd
	v+oU1edthHlux100TTals6aMEp6Ru59/KSMt9p4lwr9RidQU/UBoBfpT7c9BGTBOvsIXexpRYYJ
	QCQ2xT8Blj2f6dWH5HRISCuU9A8UzmVovCEdzO5W8ow4QgaaTDCHIrlOvcw+Oa5HEnr5h23Xy6O
	9qz/A91+8ZPEY4O5Fk49zT72CqJJ7D6Wp2GK6dxX1y2wdtDe00kRPZFqUSBEqs/Q2177ZZEmZ8x
	BmxKVCgF6SFWjDl2+V+0yem7Sg5ICv9i6pzxOBJq96njjiGPmkQFF/AzBP4850yUhX8R+X9iwqm
	1iGx+FHqBsTpM2LR2nxxlzaDydY0iT8hM4ToJdWI7wxeTPoTvM0BwQJfEaYX5nZrQKIYHsZpu8y
	MpJqoycifZXn2CPOOENFeZaqF6qxBOOp6G6DQrOCwtfeP2M5qOW2aNFAvb
X-Received: by 2002:a05:6000:2289:b0:492:7efe:3fc4 with SMTP id
 ffacd0b85a97d-4982f2b5c0emr2318492f8f.21.1794282305918; Mon, 09 Nov 2026
 19:45:05 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930150213.799245-1-anup.patel@oss.qualcomm.com>
 <20260930150213.799245-4-anup.patel@oss.qualcomm.com> <CABb+yY0gLY8VuY0pDKKm4EfS3wp3buLgF=waajaA7JD0UX-VwQ@mail.gmail.com>
 <CABBgwmsU9S2kf+RL53G8Tk4ar3=6f1zMTss_HmE42fxiwxVFpQ@mail.gmail.com> <CABb+yY0SZuCQoLF65EGY0=R4=p7fO3SU53pPhT1cgAj26u8gNA@mail.gmail.com>
In-Reply-To: <CABb+yY0SZuCQoLF65EGY0=R4=p7fO3SU53pPhT1cgAj26u8gNA@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 10 Nov 2026 09:14:54 +0530
X-Gm-Features: AclHuK_CabJq9g7mN5dukuhLCdD0ZSMtx534VbUmKJCoEfUVtt5Yuwt6FlaPoos
Message-ID: <CAAhSdy1dfRf97FACz-1hDaTJzB0jR2exXsWg+ttGCtbUmqmrcw@mail.gmail.com>
Subject: Re: [PATCH 3/4] mailbox: add direct synchronous send support
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Doug Anderson <dianders@chromium.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Rahul Pathak <rahul@summations.net>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Thomas Gleixner <tglx@kernel.org>, 
	Radu Rendec <radu@rendec.net>, Himanshu Chauhan <hchauhan@ventanamicro.com>, 
	Atish Patra <atish.patra@linux.dev>, 
	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 7:19=E2=80=AFPM Jassi Brar <jassisinghbrar@gmail.com=
> wrote:
>
> On Thu, Oct 29, 2026 at 7:27=E2=80=AFAM Anup Patel <anup.patel@oss.qualco=
mm.com> wrote:
> >
> > Hi Jassi,
> >
> > On Mon, Oct 12, 2026 at 5:52=E2=80=AFAM Jassi Brar <jassisinghbrar@gmai=
l.com> wrote:
> > >
> > > On Wed, Sep 30, 2026 at 10:06=E2=80=AFAM Anup Patel <anup.patel@oss.q=
ualcomm.com> wrote:
> > > >
> > > > From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> > > >
> > > > Some mailbox controllers can complete a transaction entirely within
> > > > the calling context, without going through the queued TX state
> > > > machine or a TX-done interrupt. Add a synchronous send path so thei=
r
> > > > clients can request one and wait for the result directly.
> > > >
> > > > Controllers advertise support via the new send_data_sync() op and
> > > > clients opt in by setting tx_sync when requesting the channel.
> > > >
> > > > Channels bound this way must not call mbox_chan_txdone() or
> > > > mbox_client_txdone(), and mbox_send_message() and mbox_flush() now
> > > > reject them, since only mbox_send_message_sync() is a valid
> > > > transmit path. The client remains responsible for serializing calls
> > > > to mbox_send_message_sync() against mbox_free_channel().
> > > >
> > > Seems like you want to use mbox_client.tx_block.
> > >
> >
> > Apologies for the delayed response, the past month I was travelling
> > followed by the Linux-7.4 merge window.
> >
> > We had tried mbox_client.tx_block method in the past and we had
> > found it to be not suitable because the mbox_send_message() will
> > use wait_for_completion_timeout() which crashes when called from
> > an atomic (non-sleepable) context. Our existing mailbox clients (such
> > as system msi, clock, etc) do mailbox transfers in an atomic context.
> > Due to this reason, currently we set mbox_client.tx_block =3D false &
> > mbox_client.knows_txdone =3D true in all our mailbox client drivers.
> >
> > Using mbox_client.tx_block =3D false & mbox_client.knows_txdone =3D tru=
e
> > still does not avoid the spinlock serialization enforced by msg_submit(=
)
> > function which works fine but adds unnecessary overhead and prevents
> > parallel message Tx from multiple CPUs to the same SBI MPXY mailbox
> > channel.
> >
> > The SBI MXPY mailbox controller driver simply sends messages to
> > higher privilege firmware upon Tx using SBI calls and when the call
> > returns the response data is returned with it. Also, there is no Tx com=
plete
> > interrupt. The higher privilege firmware may forward this message to a
> > microcontroller over RPMI queues OR it may context-switch and forward
> > this message to a secured domain (e.g. OP-TEE) to process the message.
> > The higher privilege firmware takes care of the serialization and also =
allows
> > parallel SBI MPXY calls from multiple CPUs.
> >
> > The MBOX_TXDONE_BY_RETURN and send_data_sync() callback
> > allows us to avoid the Tx queuing and "chan->lock" for SBI MPXY mailbox
> > channels since this is already taken care of by the higher privilege fi=
rmware.
> >
> 1) Your clocks can't really expect to be atomic  -
> rpmi_clk_enable/disable are prepare/unprepare callbacks which can be
> called from a sleepable context anyway.
> 2) System-MSI is a good candidate which makes me notice the shmem is
> per-cpu so currently a wider-scoped channel lock is protecting it. If
> you want lock-free access to the channel you need to guard shmem
> access with local_irq_save/restore which is anyway what should have
> been doing.
>
> For the system-msi case I think the framework can be modified to
> support it better. Instead of a prolonged back-forth I have drafted
> [1] support for a new lockfree api and the semantics documentation,
> because I also know how other platforms may benefit. Please either add
> pieces from it, or even better own it, adapt it and test it before
> submitting (even replace my s.o.b if the author wants). That will be
> the least effort for all of us.

Thanks Jassi, your changes look good to me.

I will include your patches in the next revision and also ensure that
these patches work with current RPMI drivers.

Regards,
Anup
