Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452344EDCA2
	for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2026 15:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790782714; cv=none; b=FXvRFYw7jCb2TLxWm1AwWuKo6AzWERKMiitnX541zWHM2GM8sPgm5qx+7+WMOdM8s4aoZ1VSAxJbR/FAuqPkR5DhyB58AJz4bjX7clcui/Tl0CfVoggM3/Qh8R1JQMqSX6o9PSRFVFWWgwv5n87eJ2O4IhrwFSoeOFRkBe5nf58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790782714; c=relaxed/simple;
	bh=sU4JuaYDoKZU23L6pw8eyzsNf93SPTqapvteRIG6B7w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kX7JrOvk5Rsfpb9olGvkhr7VO8ccfByhI+2uYSfPJQs4U4mzRG0SLsuHxSoDp1Ho7JPhCIIJdBVR9kwHDEnMzQxcHxDmf+7u+j34qEbWCIxBZD5Log5iVcpV49Y1Cqb6p9Ezi8RAsDvs63CAkn2adIDdjM4Vt3i/x9PiyvR8n6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/9vWsgR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/9vWsgR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36C2D1F00898;
	Wed, 30 Sep 2026 15:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790782707;
	bh=Ba/QFwkTg8jOYWScVl8gjCLVoUZwwIZIjrepC1VnFCI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l/9vWsgRL0VUkNGDSq77a9zPC1jAuj38iPnlhoxmeGhaOYGHq1ic9z+JYG4a6edO4
	 MfZrFkYPx8oYtMm9tAdRPYY0JQAs88HF7WcuxbGYLG5OFBACLGxfgemc9de/LOCLBO
	 Lcmy8jmnkFwy/IRy7wjTlA/pvmkKRmb0vz5WQg2RI7dkYd9N/vd9oRUtEfap14ZZbd
	 J2eLjQn7RjUeFq1qFkT+0WIhyl1b87/XGMbhIsrQCH7vS50vdJk+XkD7tsJPFmt1MV
	 Z6g9k0N6PRVLDquyFnci7+RTYzEYtbpSYmDaKFM0AjXmP8gopF4ZSX/30AUudpy2Ru
	 bQyl+VhIpBcYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] mailbox: riscv-sbi-mpxy: Move to send_data_sync()
 for sending messages
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anup Patel" <anup.patel@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260930150213.799245-5-anup.patel@oss.qualcomm.com>
References: <20260930150213.799245-1-anup.patel@oss.qualcomm.com>
 <20260930150213.799245-5-anup.patel@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 15:38:26 +0000
Message-Id: <20260930153827.36C2D1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] pmdomain: riscv: missing tx_sync causes RPMI PM domain probe failu=
re
- [High] mailbox: riscv-sbi-mpxy: missing IRQ disable causes payload corrup=
tion
- [Medium] mailbox: riscv-rpmi: atomic context calls sleepable mbox_send_me=
ssage_sync()
--

commit 612dfab344d90d3c136efe88349ea5fa93e33818
Author: Anup Patel <anup.patel@oss.qualcomm.com>

mailbox: riscv-sbi-mpxy: Move to send_data_sync() for sending messages

This commit transitions the SBI MPXY mailbox driver from the asynchronous
send_data() callback to the synchronous send_data_sync() callback. It remov=
es
the per-channel spinlock and the manual mbox_client_txdone() call to allow
parallel message sending from multiple CPUs.

> diff --git a/drivers/clk/clk-rpmi.c b/drivers/clk/clk-rpmi.c
> index 921296aafa686..e365cb8a8dac3 100644
> --- a/drivers/clk/clk-rpmi.c
> +++ b/drivers/clk/clk-rpmi.c
> @@ -527,7 +527,7 @@ static int rpmi_clk_probe(struct platform_device *pde=
v)
>  	context->client.dev		=3D context->dev;
>  	context->client.rx_callback	=3D NULL;
>  	context->client.tx_block	=3D false;
> -	context->client.knows_txdone	=3D true;
> +	context->client.tx_sync		=3D true;

[Severity: High]
This updates the clock driver to set tx_sync =3D true, but was the pmdomain
driver in drivers/pmdomain/riscv/riscv-rpmi-device-power.c missed?

The core mailbox framework in mbox_send_message_sync() returns -EOPNOTSUPP
if MBOX_TXDONE_BY_RETURN is missing (which happens when tx_sync is false).

Since rpmi_pm_domain_probe() still sets knows_txdone =3D true rather than
tx_sync =3D true, won't its mailbox messages be rejected during probe, caus=
ing
it to fail unconditionally?

>  	context->client.tx_tout		=3D 0;
> =20
>  	context->chan =3D mbox_request_channel(&context->client, 0);

> [ ... ]

> diff --git a/drivers/mailbox/riscv-sbi-mpxy-mbox.c b/drivers/mailbox/risc=
v-sbi-mpxy-mbox.c
> index cba95b8406ee9..18d5ed0b15610 100644
> --- a/drivers/mailbox/riscv-sbi-mpxy-mbox.c
> +++ b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
> [ ... ]
> @@ -138,52 +138,54 @@ static void mpxy_mbox_send_rpmi_data(struct mpxy_mb=
ox_channel *mchan,
> [ ... ]
>  		if (!(mchan->attrs.capability & SBI_MPXY_CHAN_CAP_SEND_WITH_RESP)) {
> -			msg->error =3D -EIO;
> +			error =3D -EIO;
>  			break;
>  		}
> -		msg->error =3D sbi_mpxy_send_message_with_resp(mchan->channel_id,
> -							     msg->data.service_id,
> -							     msg->data.request,
> -							     msg->data.request_len,
> -							     msg->data.response,
> -							     msg->data.max_response_len,
> -							     &msg->data.out_response_len);
> +		error =3D sbi_mpxy_send_message_with_resp(mchan->channel_id,
> +							msg->data.service_id,
> +							msg->data.request,
> +							msg->data.request_len,
> +							msg->data.response,
> +							msg->data.max_response_len,
> +							&msg->data.out_response_len);

[Severity: High]
By moving to mbox_send_message_sync(), we no longer take the channel spinlo=
ck
(which safely serialized calls and disabled hard interrupts) before sending
messages.

Inside sbi_mpxy_send_message_with_resp(), mpxy_local_get() uses get_cpu(),
which only disables preemption but leaves local interrupts enabled.

If a hardirq (like rpmi_sysmsi_irq_mask()) preempts a process-context messa=
ge
on the same CPU, won't both concurrently access the exact same per-CPU
mpxy->shmem buffer?

Could this silently overwrite the interrupted thread's payload and lead to
data corruption in the SBI MPXY payload before it reaches the firmware?

>  		break;
>  	case RPMI_MBOX_MSG_TYPE_SEND_WITHOUT_RESPONSE:

> [ ... ]

> diff --git a/include/linux/mailbox/riscv-rpmi-message.h b/include/linux/m=
ailbox/riscv-rpmi-message.h
> index d5362b5821f95..5269ccf064930 100644
> --- a/include/linux/mailbox/riscv-rpmi-message.h
> +++ b/include/linux/mailbox/riscv-rpmi-message.h
> [ ... ]
> @@ -238,17 +233,8 @@ static inline void *rpmi_mbox_get_msg_response(struc=
t rpmi_mbox_message *msg)
>  static inline int rpmi_mbox_send_message(struct mbox_chan *chan,
>  					 struct rpmi_mbox_message *msg)
>  {
> -	int ret;
> -
> -	/* Send message for the underlying mailbox channel */
> -	ret =3D mbox_send_message(chan, msg);
> -	if (ret < 0)
> -		return ret;
> -
> -	/* Explicitly signal txdone for mailbox channel */
> -	ret =3D msg->error;
> -	mbox_client_txdone(chan, ret);
> -	return ret;
> +	/* Send message for the underlying mailbox channel synchronously */
> +	return mbox_send_message_sync(chan, msg);

[Severity: Medium]
The mbox_send_message_sync() API is explicitly documented as a sleepable
function that must not be called from atomic context.

However, rpmi_mbox_send_message() is indirectly called by
rpmi_sysmsi_irq_mask() from the core IRQ framework in an atomic context
with raw spinlocks held.

Although the current riscv-sbi-mpxy controller implementation might not
sleep, could this API contract violation trigger a warning or break if the
mailbox core adds might_sleep() checks?

>  }
> =20
>  #endif /* _LINUX_RISCV_RPMI_MESSAGE_H_ */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930150213.7992=
45-1-anup.patel@oss.qualcomm.com?part=3D4
