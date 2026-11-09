Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794232175;
	b=0JwobW/bhqm2Y9F14joFCTQ+KNBzmBuLHy9Lb9bK+0KwvmtT7cnuFHrGMB5ohsz6WHu5
	 0IVYfXoFOnXjnATaUeXbYxgtOjmIUQdHDI0HhRxeRAtmcXa4CFcsnfwShPP0no2auEr7P
	 PqxMooZ0AFJKogU22eu3ZIc7YAwE48tFZpq/cXUKHzwKwS7Bs5ZhqHV9OAdAW18/oT+Eo
	 XqlM4wEwy88B0SGSptBNl6Mz67IjZAtPuIQ5XBBo+YBQPr2l0A94lLvhbNOiW1qCqBHhK
	 2Ju8Zog86H61VI5OlEMunrgkvN838hb5h2PCf6WFkZDY2UmtI/NHCpp3YaL3D9VBGRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FyAr9qqHmbSkkVwj13RsrpvkaRMjPb3WgaMEGtmY00I=;
	b=1NCeY3/aGmh4gmDs2bwoZIFDKKjkehRLdqztDwtHavrt38DCbkAAmHCZGeDqV3zJ6AXp
	 fg2j1tYBEXAEunRbmi6LiaDjjdE/vHoX66UbkUQEyb8BLnvK0UTFSV0JZkMeRlkmt3SFJ
	 agi5YgDF+EoUlw5P2jk4U388pct5U5YzYw+tSQgrxjiodIS5b+wJBlGNeSZQ1ax0+giRn
	 1HSo5QMOx/6Ymdm05qFVaasTbpzkjqbKjCKyQYO6uRgZTR7voPiNL4J0yZG4ECAAfPYRQ
	 ywHEjYqWPKpvyJzUwW7p8SGG/UfgZNCPIQC4tiPygbdEg3NCPfGp09TFJtkFKwsi/Eg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WgJJzWlB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19790606D802
	for <linux-clk@vger.kernel.org>; Mon,  9 Nov 2026 13:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19790606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WgJJzWlB
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-716da696c1aso540853eaf.0
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 05:49:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794232174; cv=none;
        d=google.com; s=arc-20260327;
        b=r+pE5ce2efaz/4fFCly7l2x3di3HxzqFOqa9aKwwLzVHGuNCd8GunKROM9Gua9O5eC
         R/P05Qth1mdBUhhRWeV3EVf3sIIFkYVnjip198IJUZQdJ1CLWORs0fE/dsc8xy0DGxNI
         qPA7FR1OAFzbIC5RU6/9h7uhKKODlCvXeXZ1zlZMtBRHbjzkI5nf5eL0j4CkLje3MPaM
         JcBXWXVZWcaVmFlD7keBf1RvK/ihVyWr82aeGJedAQJDTz+KAp02ueXGfy7xl4BXLK2H
         YukhCgKRXz/FUrpzcrNMIEmDZKW9qzgrCiwmI+MkiTsBEOVvQRbWidhoXR5BtqGuz7kp
         pGSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FyAr9qqHmbSkkVwj13RsrpvkaRMjPb3WgaMEGtmY00I=;
        fh=oSXGIlj+dOovTc8+G4lk38fpSbQb+DXsp1hLPuuGbKM=;
        b=hWD8e2PuFV2lBsLJZqmeEvbPzBWl7h9+Hpncsn1CBHL8TAgaXZ5K9RyT6W824q2Qe+
         bVlmEki0PlWkWBjTr7A8ZJqons9w99FtRbrI88PaztAArNaSVukkHyvGtFPcBKn2zsBr
         egaNIORECDMXifrqXbYED0Rubyujt9+nRZAtk0jgAT+ufkpF9zC4X3cbS50kaX8s3beh
         MMbJj8DC9tzXSNGk08q5lYc+iRLyBWykneCBuk8oL9vrtDablUNzKcXfbDtJck8dbJ2U
         geZXfvXPUi3JNvgLiosqXeLKuiR7diHym+jJ9I47qZTfgDvajVFqFxIvm4R9GwgpCGYp
         mrqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794232174; x=1794836974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FyAr9qqHmbSkkVwj13RsrpvkaRMjPb3WgaMEGtmY00I=;
        b=WgJJzWlBGW0QGA1sGDaR4dReBHws6qZzcznwiC3J28Cf2fm2aUCfd4N3xGGwVvjhEk
         gRujHUIfPFeSym2H8iuVlX1pKOMv9epJIu5RXqKnveicuiv0sF+D34dHLoSiP5QlKEy0
         0v+mmmaz0/2DUanYcOWBiTGpigVfehFyyaLMy9KaABZligFsbSomPUpcOPSFA1vSJ5Jr
         EpCnls496FfhuszBv7Lc/oljV9jOpFY2PgOrBmj0xSDcGTCCWy19nSHEQ1rJx1dH1Ued
         fW88Fd/AgjxNJUNHA64Z6z3Cbr0g3uaRpJj76BeNMyT++eXXfCql1898Bf5GEMH90Dyu
         PXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794232174; x=1794836974;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FyAr9qqHmbSkkVwj13RsrpvkaRMjPb3WgaMEGtmY00I=;
        b=QLgBkQ5c/C+B31oCeYF4x6gklGw1WSXSNB5+4TY3nb85uOXtt6Cksxd1t75RVkKH6o
         6mBnvZpjbbfFoIBJ0unyhsyZhx4e1ep8R41ShUte/rzXRvj0esaR5Psyle6IPIL9tT+w
         1xFOuQojMIgi7PNvd7+pcAG6CVSRPNd5sbeOFkASpMAhguks7+u3+4eJzYgVbXUx9Lqo
         HZrW0ZCpEdwJ0dfRnmkYWGgpe1u/P1FWeV0n4+2I5BET9Y8O5cPhyVnNJRRiZ7E5DrF3
         tBrCddWqXBMiZCKQgAqI0tNEViiYH5DfRQchhoeU3tH1asO0W2F71GAJarU9bcfp73we
         Ls2Q==
X-Forwarded-Encrypted: i=1; AL+hErGO5ZoXFrlY1E/g6IlUjn9fj5b7Vr4hMBVplA0Kxt/pr7fg9SUVCUgSDzWpvftRKWUW+CLs6NbTBoA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KQqVgGvX32n48b+2EXzxVtQ8nyEoNIGE73rYArSTtyNTfHHP/
	YOfm4e1KpDK/JnELpSekf+S/1tNUorXGcBCPM9pNfLUM9tmm6iGvNuE9TqmS7Yso9bwbQ1aCfgI
	oTI8tTsS1sBQsd9p4wk+N9LXfCpkoPJk=
X-Gm-Gg: AYBFou0DnDbwzzUdJAVIONY/1QY5oMCKTEgdIRkXG6ljoRoVsjOTOFrnTLURj8pr2ZQ
	0RcwGre3JKOhvhRvlc37+F/oZ7IM9NRSXpUAcaoPgdkWmnwzs2KE9cdYX0j/pYqaaslQairk4Qt
	TkGZVb8Y/wGpAmK5m95ZnAiCvmjrpS4mSKTOaPYMCxQNXkqN/L6r+VoEMgGBUJBpmRJZhYp5opz
	zfkthGKPEkBQ3HHaP9+zsVJFpkhqwGUZhYGy8+1nDjVO2zZS5kfQrb99P5csXrNjtLTVmrzXeu/
	lggackXJKtL6ZGcduP3ODdWjfLGvo554SC8yLWRgLs96sjQAXa2ayCdhuXmnk1rO6l2+By0yjf9
	MdnHtbxRPpd10WEORaR7JBflAbBpYV+6zGbkjCZmvlMeuB+kCqcIJcsJQog==
X-Received: by 2002:a05:6820:55ca:20b0:716:d48a:ee93 with SMTP id
 006d021491bc7-7170f26a5c0mr1420360eaf.61.1794232173953; Mon, 09 Nov 2026
 05:49:33 -0800 (PST)
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
 <CABBgwmsU9S2kf+RL53G8Tk4ar3=6f1zMTss_HmE42fxiwxVFpQ@mail.gmail.com>
In-Reply-To: <CABBgwmsU9S2kf+RL53G8Tk4ar3=6f1zMTss_HmE42fxiwxVFpQ@mail.gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 9 Nov 2026 08:49:20 -0500
X-Gm-Features: AclHuK9ZpOtwMmKrK6lvy0K3xqP_D3JRQq0vMpVANN7aLErFYx3-QsCqINQknZs
Message-ID: <CABb+yY0SZuCQoLF65EGY0=R4=p7fO3SU53pPhT1cgAj26u8gNA@mail.gmail.com>
Subject: Re: [PATCH 3/4] mailbox: add direct synchronous send support
To: Anup Patel <anup.patel@oss.qualcomm.com>, Doug Anderson <dianders@chromium.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Rahul Pathak <rahul@summations.net>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Himanshu Chauhan <hchauhan@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 7:27=E2=80=AFAM Anup Patel <anup.patel@oss.qualcomm=
.com> wrote:
>
> Hi Jassi,
>
> On Mon, Oct 12, 2026 at 5:52=E2=80=AFAM Jassi Brar <jassisinghbrar@gmail.=
com> wrote:
> >
> > On Wed, Sep 30, 2026 at 10:06=E2=80=AFAM Anup Patel <anup.patel@oss.qua=
lcomm.com> wrote:
> > >
> > > From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> > >
> > > Some mailbox controllers can complete a transaction entirely within
> > > the calling context, without going through the queued TX state
> > > machine or a TX-done interrupt. Add a synchronous send path so their
> > > clients can request one and wait for the result directly.
> > >
> > > Controllers advertise support via the new send_data_sync() op and
> > > clients opt in by setting tx_sync when requesting the channel.
> > >
> > > Channels bound this way must not call mbox_chan_txdone() or
> > > mbox_client_txdone(), and mbox_send_message() and mbox_flush() now
> > > reject them, since only mbox_send_message_sync() is a valid
> > > transmit path. The client remains responsible for serializing calls
> > > to mbox_send_message_sync() against mbox_free_channel().
> > >
> > Seems like you want to use mbox_client.tx_block.
> >
>
> Apologies for the delayed response, the past month I was travelling
> followed by the Linux-7.4 merge window.
>
> We had tried mbox_client.tx_block method in the past and we had
> found it to be not suitable because the mbox_send_message() will
> use wait_for_completion_timeout() which crashes when called from
> an atomic (non-sleepable) context. Our existing mailbox clients (such
> as system msi, clock, etc) do mailbox transfers in an atomic context.
> Due to this reason, currently we set mbox_client.tx_block =3D false &
> mbox_client.knows_txdone =3D true in all our mailbox client drivers.
>
> Using mbox_client.tx_block =3D false & mbox_client.knows_txdone =3D true
> still does not avoid the spinlock serialization enforced by msg_submit()
> function which works fine but adds unnecessary overhead and prevents
> parallel message Tx from multiple CPUs to the same SBI MPXY mailbox
> channel.
>
> The SBI MXPY mailbox controller driver simply sends messages to
> higher privilege firmware upon Tx using SBI calls and when the call
> returns the response data is returned with it. Also, there is no Tx compl=
ete
> interrupt. The higher privilege firmware may forward this message to a
> microcontroller over RPMI queues OR it may context-switch and forward
> this message to a secured domain (e.g. OP-TEE) to process the message.
> The higher privilege firmware takes care of the serialization and also al=
lows
> parallel SBI MPXY calls from multiple CPUs.
>
> The MBOX_TXDONE_BY_RETURN and send_data_sync() callback
> allows us to avoid the Tx queuing and "chan->lock" for SBI MPXY mailbox
> channels since this is already taken care of by the higher privilege firm=
ware.
>
1) Your clocks can't really expect to be atomic  -
rpmi_clk_enable/disable are prepare/unprepare callbacks which can be
called from a sleepable context anyway.
2) System-MSI is a good candidate which makes me notice the shmem is
per-cpu so currently a wider-scoped channel lock is protecting it. If
you want lock-free access to the channel you need to guard shmem
access with local_irq_save/restore which is anyway what should have
been doing.

For the system-msi case I think the framework can be modified to
support it better. Instead of a prolonged back-forth I have drafted
[1] support for a new lockfree api and the semantics documentation,
because I also know how other platforms may benefit. Please either add
pieces from it, or even better own it, adapt it and test it before
submitting (even replace my s.o.b if the author wants). That will be
the least effort for all of us.

Regards,
Jassi
[1] https://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git/l=
og/?h=3Djsb/rfc-synch-xfer
