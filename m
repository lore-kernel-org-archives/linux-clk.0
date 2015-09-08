Return-Path: <linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org>
MIME-Version: 1.0
In-Reply-To: <80094129.LHZFOe1ZPU@wuerfel>
References: <1441349872-4560-1-git-send-email-bhupesh.sharma@freescale.com>
 <1441349872-4560-5-git-send-email-bhupesh.sharma@freescale.com>
 <80094129.LHZFOe1ZPU@wuerfel>
Date: Tue, 8 Sep 2015 15:06:16 -0500
Message-ID: <CADRPPNR-cSSQC5sLMmoqcxX46J6hdULa_V4v2BK7T8s8pcX0cg@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] doc/bindings: Update PCIe devicetree binding
 documentation for LS2080A
From: Li Yang <leoli@freescale.com>
To: Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Bhupesh Sharma <bhupesh.sharma@freescale.com>, Catalin.Marinas@arm.com,
 olof@lixom.net, will.deacon@arm.com,
 Minghuan Lian <Minghuan.Lian@freescale.com>, marc.zyngier@arm.com,
 bhupesh.linux@gmail.com, linux-clk@vger.kernel.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, Sep 7, 2015 at 6:32 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Friday 04 September 2015 12:27:46 Bhupesh Sharma wrote:
>> @@ -4,7 +4,8 @@ This PCIe host controller is based on the Synopsis Designware PCIe IP
>>  and thus inherits all the common properties defined in designware-pcie.txt.
>>
>>  Required properties:
>> -- compatible: should contain the platform identifier such as "fsl,ls1021a-pcie"
>> +- compatible: should contain the platform identifier such as "fsl,ls1021a-pcie",
>> +  "fsl,ls2080a-pcie".
>>  - reg: base addresses and lengths of the PCIe controller
>>  - interrupts: A list of interrupt outputs of the controller. Must contain an
>>    entry for each entry in the interrupt-names property.
>>
>
> Are the two PCIe hosts mutually compatible? If they are, you should mandate
> one of the strings as the base model for identification, with the additional
> model being optional for identification of the specific SoC.

It seems that controllers on these chips are not exactly the same.
They will get different driver data by matching the compatible
strings.  Probably we could define a more generic compatible string,
such as "fsl,layerscape-pcie" or "fsl,ls-pcie".

>
> It would also be good to add a string with the specific version number of the
> designware PCIe block that is being used there.

The binding has mentioned to reference the designware-pcie.txt.  But
it might be more clear to mention the designware compatible string
"snps,dw-pcie" again in the compatible part.  Currently there is no
version number defined in the designware-pcie binding.  It might be
hard to get this information for some SoCs.

Regards,
Leo

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
